//
//  FZDownLoader.h
//  iOSAnimation
//
//  Created by may on 2020/7/24.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZDownLoader : NSObject

- (void)downLoadURLStr:(NSString *)URLStr;

- (void)pauseCurrentTask;

- (void)cancleCurrentTask;

- (void)cancleAndCleanCurrentTask;

@end

NS_ASSUME_NONNULL_END
