//
//  NSURL+audioPlayer.h
//  iOSAnimation
//
//  Created by may on 2020/8/7.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYKitMacro.h>

NS_ASSUME_NONNULL_BEGIN

//YYSYNTH_DUMMY_CLASS(NSURL_audioPlayer)

@interface NSURL (audioPlayer)

- (NSURL *)streamURL;

- (NSURL *)httpURL;

@end

NS_ASSUME_NONNULL_END
