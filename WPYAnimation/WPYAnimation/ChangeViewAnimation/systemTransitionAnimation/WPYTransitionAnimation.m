//
//  WPYTransitionAnimation.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYTransitionAnimation.h"

@implementation WPYTransitionAnimation

+ (WPYTransitionAnimation *)createTransitionAnimationWithFunctionName:(NSString *)functionName Type:(NSString *)type SubType:(NSString *)subtype Duration:(CFTimeInterval)duration {
    WPYTransitionAnimation * transitionAnimation = [WPYTransitionAnimation animation];
    [transitionAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:functionName ]];
    transitionAnimation.duration = duration;
    transitionAnimation.type = type;
    transitionAnimation.subtype = subtype;
    return transitionAnimation;
}
@end
