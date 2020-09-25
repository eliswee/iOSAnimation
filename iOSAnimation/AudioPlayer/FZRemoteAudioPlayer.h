//
//  FZRemoteAudioPlayer.h
//  iOSAnimation
//
//  Created by may on 2020/8/7.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FZRemotePlayerState) {
    FZRemotePlayerStateUnknown = 0,
    FZRemotePlayerStateLoading = 1,
    FZRemotePlayerStatePlaying = 2,
    FZRemotePlayerStateStopped = 3,
    FZRemotePlayerStatePuased  = 4,
    FZRemotePlayerStateFailed  = 5
};

// 抛出数据两种模式： 推模式(block, 通知， 代理, 监听)、  拉模式( 轮询，get ）

@interface FZRemoteAudioPlayer : NSObject

@property (nonatomic, assign) float rate;
@property (nonatomic, assign) float volume;
@property (nonatomic, assign) BOOL mute;

@property (nonatomic, assign, readonly) float progress;
@property (nonatomic, strong, readonly) NSURL *URL;
@property (nonatomic, assign, readonly) float loadDataProgress;

@property (nonatomic, assign, readonly) NSTimeInterval totalTime;
@property (nonatomic, copy, readonly) NSString *totalTimeFormat;

@property (nonatomic, assign, readonly) NSTimeInterval currentTime;
@property (nonatomic, copy, readonly) NSString *currentTimeFormat;


@property (nonatomic, assign, readonly) FZRemotePlayerState playerState;
@property (nonatomic, copy) void(^stateChangeCallBack)(FZRemotePlayerState state);
@property (nonatomic, copy) dispatch_block_t playEndCallBack;


+ (instancetype)shareInstance;

/// 入口方法
/// @param URLStr 资源URL
/// @param isCache 是否需要缓存到本地
- (void)playURL:(NSString *)URLStr isCache:(BOOL)isCache;

- (void)pause;

- (void)resume;

- (void)stop;

// 进度
- (void)seekToProgress:(float)progress;

// 快进/快退
- (void)seekToTimeDiffer:(NSTimeInterval)dimeDiffer;

@end

NS_ASSUME_NONNULL_END
