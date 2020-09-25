//
//  FZDownLoader.m
//  iOSAnimation
//
//  Created by may on 2020/7/24.
//  Copyright © 2020 may. All rights reserved.
//

#import "FZDownLoader.h"
#import "FZFileManager.h"
#import <NSString+YYAdd.h>

typedef NS_ENUM(NSUInteger, FZDownLoadStatu) {
    FZDownLoadStatuPaused,
    FZDownLoadStatuDownLoading,
    FZDownLoadStatuSuccess,
    FZDownLoadStatuCancled,
    FZDownLoadStatuFiled,
};

@interface FZDownLoader () <NSURLSessionDataDelegate> {
    long long _tempLength;
    long long _totalLength;
}

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSOutputStream *outStream;
@property (nonatomic, strong) NSMutableURLRequest *request;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *cacheFilePath;
@property (nonatomic, copy) NSString *tempFilePath;
@property (nonatomic, copy) NSString *targetURLStr;
@property (nonatomic, weak) NSURLSessionDataTask *dataTask;
@property (nonatomic, assign) FZDownLoadStatu downLoadStatus;
@end

@implementation FZDownLoader

#pragma mark - public
 
// 入口方法  开始/继续
- (void)downLoadURLStr:(NSString *)URLStr {
    
    if (!URLStr.length) {
        return;
    }
    
    self.targetURLStr = URLStr;
    
    NSURL *URL = [NSURL URLWithString:URLStr];
    
    // 是当前任务，继续
    if ([URL isEqual:self.dataTask.originalRequest.URL]) {
        if (self.downLoadStatus == FZDownLoadStatuPaused) {
            [self resumeCurrentTask];
            return;
        }
    }
    
    self.fileName = URL.lastPathComponent;
    
    // 下载完成的
    if ([FZFileManager fileExist:self.cacheFilePath]) {
        NSLog(@"已下载过");
        return;
    }
    
    _tempLength = [FZFileManager fileLength:self.tempFilePath];
    [self downLoadWithURL:URL offset:_tempLength];
}

- (void)pauseCurrentTask {
    if (self.downLoadStatus == FZDownLoadStatuDownLoading) {
        [self.dataTask suspend];
        self.downLoadStatus = FZDownLoadStatuPaused;
    }
}

- (void)cancleCurrentTask {
    [self.session invalidateAndCancel];
    self.session = nil;
    self.downLoadStatus = FZDownLoadStatuCancled;
}

- (void)cancleAndCleanCurrentTask {
    [FZFileManager removeFile:self.tempFilePath];
    [self cancleCurrentTask];
}

#pragma mark - private

- (void)resumeCurrentTask {
    if (self.downLoadStatus == FZDownLoadStatuPaused && self.dataTask) {
        [self.dataTask resume];
        self.downLoadStatus = FZDownLoadStatuDownLoading;
    }
}

- (void)downLoadWithURL:(NSURL *)url offset:(long long)offset {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:[NSString stringWithFormat:@"bytes=%lld-", offset] forHTTPHeaderField:@"Range"];
    self.dataTask = [self.session dataTaskWithRequest:request];
    
    
    // 继续和暂停(挂起)必须调用的次数一样才可以，eg：调用了两次暂停就要调用两次开始才会开始。调用了两次开始就要调用两次暂停才会暂停。
//    [task suspend];
    [self resumeCurrentTask];
}

#pragma mark - sessionDelegate

/// 收到响应-header
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    _totalLength = [httpResponse.allHeaderFields[@"Content-Length"] longLongValue]; // Content-Length 是本次请求的数据大小，不是实际的文件大小
    // 取值 rang
    if (httpResponse.allHeaderFields[@"Content-Range"]) { // Content-Range ：请求的数据范围/实际的文件大小
        NSString *rangeStr = httpResponse.allHeaderFields[@"Content-Range"];
        _totalLength = [[[rangeStr componentsSeparatedByString:@"/"] lastObject] longLongValue];
    }
    
    NSLog(@"收到响应：%@", response);
    
    if (_tempLength == _totalLength) {
        self.downLoadStatus = FZDownLoadStatuSuccess;
        [FZFileManager moveFileFromPath:self.tempFilePath toPath:self.cacheFilePath];
        completionHandler(NSURLSessionResponseCancel);
        return;
    }
    
    /// 出错 重试
    if (_tempLength > _totalLength) {
        // 移除错误文件
        [FZFileManager removeFile:self.tempFilePath];
        [self downLoadWithURL:response.URL offset:0];
        // 取消本次
        completionHandler(NSURLSessionResponseCancel);
        return;
    }
    self.downLoadStatus = FZDownLoadStatuDownLoading;
    self.outStream = [NSOutputStream outputStreamToFileAtPath:self.tempFilePath append:YES];
    [self.outStream open];
    // 文件接收中，继续处理
    completionHandler(NSURLSessionResponseAllow);
}

/// 接收数据
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSLog(@"收到数据");
    [self.outStream write:data.bytes maxLength:data.length];
}

/// 请求完成
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"请求完成");
    
    if (error == nil) {
        
        /*
            要验证是否下载成功，用文件的MD5比对
         */
        
        
        [FZFileManager moveFileFromPath:self.tempFilePath toPath:self.cacheFilePath];
        self.downLoadStatus = FZDownLoadStatuSuccess;
    }
    else {
        
        // 可能原因 : 取消code:-999  断网  异常
        
        if (error.code == -999) { // 取消
            self.downLoadStatus = FZDownLoadStatuCancled;
        } else {
            self.downLoadStatus = FZDownLoadStatuFiled;
        }
    }
    
    [self.outStream close];
    self.outStream = nil;
}

#pragma mark -getters

- (NSString *)cacheFilePath {
    if (!_cacheFilePath) {
        _cacheFilePath = [FZFileManager cacheFilePathWithName:self.fileName];
    }
    return _cacheFilePath;
}

- (NSString *)tempFilePath {
    if (!_tempFilePath) {
        _tempFilePath = [FZFileManager tempFilePathWithName:[self.targetURLStr md5String]];
    }
    return _tempFilePath;
}

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

@end
