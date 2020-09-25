//
//  NSURL+audioPlayer.m
//  iOSAnimation
//
//  Created by may on 2020/8/7.
//  Copyright © 2020 may. All rights reserved.
//

#import "NSURL+audioPlayer.h"

@implementation NSURL (audioPlayer)

- (NSURL *)streamURL {
    NSURLComponents *components = [NSURLComponents componentsWithString:self.absoluteString];
    [components setScheme:@"streaming"];
    return [components URL];
}

- (NSURL *)httpURL {
    NSURLComponents *components = [NSURLComponents componentsWithString:self.absoluteString];
    [components setScheme:@"http"];
    return [components URL];
}

@end
