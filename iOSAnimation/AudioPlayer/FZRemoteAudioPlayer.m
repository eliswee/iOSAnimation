//
//  FZRemoteAudioPlayer.m
//  iOSAnimation
//
//  Created by may on 2020/8/7.
//  Copyright © 2020 may. All rights reserved.
//

#import "FZRemoteAudioPlayer.h"
#import <AVFoundation/AVFoundation.h> // 播放器框架
#import "NSURL+audioPlayer.h"
#import "FZRemoteAudioPlayerResourceDelegate.h"

@interface FZRemoteAudioPlayer()

@property (nonatomic, strong) AVPlayer *player;

@property (nonatomic, strong) FZRemoteAudioPlayerResourceDelegate *resourceDelegate;

@end

@implementation FZRemoteAudioPlayer

#pragma mark - publicMethods

static FZRemoteAudioPlayer *_fzRemoteAudioPlayer;

+ (instancetype)shareInstance {
    if (!_fzRemoteAudioPlayer) {
        _fzRemoteAudioPlayer = [FZRemoteAudioPlayer new];
    }
    return _fzRemoteAudioPlayer;;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _fzRemoteAudioPlayer = [super allocWithZone:zone];
    });
    return _fzRemoteAudioPlayer;
}

- (void)playURL:(NSString *)URLStr isCache:(BOOL)isCache {
    
    // 播放分三步
    // 1.请求资源(ASURLAsset->AVURLAssetResourceLoader)
    // 2.组织资源(AVPlayerItem)
    // 3.播放(AVPlayer) 如果资源加载比较慢，调用了play方法不会立即播放
    
    // 框架封装现成
//    [AVPlayer playerWithURL:URL];
    
    // 防止重复observe crush
    [self cleaObserver:self.player.currentItem];
    
    NSURL *URL = [NSURL URLWithString:URLStr];
    if (isCache) {
        URL = [URL streamURL]; // 只有streaming协议的URL可以触发delegate
    }
    
    // 利用ASURLAsset 的 属性 resourceLoader（AVURLAssetResourceLoader） 加载资源 ， AVURLAssetResourceLoader
    AVURLAsset *urlAsset = [AVURLAsset assetWithURL:URL];
    [urlAsset.resourceLoader setDelegate:self.resourceDelegate queue:dispatch_queue_create("fzRemoteResourceDelegateQueue", NULL)];
    
    // 组织资源
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:urlAsset];
    // 资源组织者的AVPlayerItemStatus status 状态表明是否准备好资源可用于播放  要监听一下
    [item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    // 播放
    self.player = [AVPlayer playerWithPlayerItem:item];
}

- (void)pause {
    [self.player pause];
}

- (void)resume {
    [self.player play];
}

- (void)stop {
    [self.player pause];
    self.player = nil;
}

- (void)setRate:(float)rate {
    [self.player setRate:rate];
}

- (void)setVolume:(float)volume {
    [self.player setVolume:volume];
}

- (void)setMute:(BOOL)mute {
    [self.player setMuted:mute];
}

- (void)seekToProgress:(float)progress {
    if (progress < 0 || progress > 1) { return; }
    
//    CMTime 影片时间
    
//    总时长
    CMTime totalTime = self.player.currentItem.duration;
    
//    CMTime -> sec
    NSTimeInterval totalSec = CMTimeGetSeconds(totalTime);
    NSTimeInterval playSec = totalSec * progress;
//    sec -> CMTime
    CMTime playTime = CMTimeMake(playSec, 1); // 参数？
    
    [self.player seekToTime:playTime completionHandler:^(BOOL finished) {
        if (finished) {
            NSLog(@"确定加载这个时间点的资源");
        }
        else {
            NSLog(@"取消加载这个时间点的资源"); // eg: 拖动进度条到下一个时间节点->取消这次的加载
        }
    }];
}

- (void)seekToTimeDiffer:(NSTimeInterval)dimeDiffer {
    
    NSTimeInterval totalSec = [self totalSec];
    
}

#pragma mark - privateMethods

- (void)cleaObserver:(AVPlayerItem *)item {
    if (!item) {return;}
    [self removeObserver:self forKeyPath:@"status"];
    [self removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
}

- (void)addObserver:(AVPlayerItem *)item {
    [item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:NSKeyValueObservingOptionNew context:nil];
}

- (NSTimeInterval)totalSec {
    CMTime totoalTime = self.player.currentItem.duration;
    NSTimeInterval totalSec = CMTimeGetSeconds(totoalTime);
    if (isnan(totalSec)) {
        return 0;;
    }
    return totalSec;;
}

- (NSTimeInterval)currentTime {
    CMTime currentTime = self.player.currentItem.currentTime;
    NSTimeInterval currentSec = CMTimeGetSeconds(currentTime);
    if (isnan(currentSec)) {
        return 0;;
    }
    return currentSec;;
}

#pragma mark - observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        
    }
    else if ([keyPath isEqualToString:@"playbackLikelyToKeepUp"]) {
        
    }
}


#pragma mark - lazyLoad

- (FZRemoteAudioPlayerResourceDelegate *)resourceDelegate {
    if (!_resourceDelegate) {
        _resourceDelegate = [[FZRemoteAudioPlayerResourceDelegate alloc] init];
    }
    return _resourceDelegate;
}

@end
