//
//  FZRemoteAudioPlayerResourceDelegate.m
//  iOSAnimation
//
//  Created by may on 2020/8/10.
//  Copyright © 2020 may. All rights reserved.
//

#import "FZRemoteAudioPlayerResourceDelegate.h"

@implementation FZRemoteAudioPlayerResourceDelegate

// not main queue

// 资源请求
- (BOOL)resourceLoader:(AVAssetResourceLoader *)resourceLoader shouldWaitForLoadingOfRequestedResource:(AVAssetResourceLoadingRequest *)loadingRequest {
    
//    NS_STRING_ENUM
//    NS_EXTENSIBLE_STRING_ENUM
    
//    改造请求去加载 本地假数据
    loadingRequest.contentInformationRequest.contentLength = 4093201;
    loadingRequest.contentInformationRequest.contentType = @"public.mp3";
    loadingRequest.contentInformationRequest.byteRangeAccessSupported = YES;
    
    
    // 加载数据流程
    // 本地假数据
    // NSDataReadingMappedIfSafe : 不实际加载数据到内存，通过地址映射的方式映射rom中的数据
    NSData *localData = [NSData dataWithContentsOfFile:@"/Users/may/Desktop/Pang/xx/码哥FM/第2阶段资料/两天共有资料/资源/235319.mp3" options:NSDataReadingMappedIfSafe error:nil];
    
    long long requestOffset = loadingRequest.dataRequest.requestedOffset;
//    loadingRequest.dataRequest.currentOffset
    NSInteger requestLenght = loadingRequest.dataRequest.requestedLength;
    
    NSData *subData = [localData subdataWithRange:NSMakeRange(requestOffset, requestLenght)];
    
    [loadingRequest.dataRequest respondWithData:subData];
    
    [loadingRequest finishLoading];
    
    return YES;
}


// 取消加载 -
- (void)resourceLoader:(AVAssetResourceLoader *)resourceLoader didCancelLoadingRequest:(AVAssetResourceLoadingRequest *)loadingRequest {
    
}

@end
