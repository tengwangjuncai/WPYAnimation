//
//  WPYLoginIcon.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/2.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYLoginIcon.h"

@implementation WPYLoginIcon

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)beginLoginAnimation {
    
    
    CABasicAnimation *loginAnimation = [CABasicAnimation animation];
    
    loginAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.frame.origin.x, self.frame.origin.y)];
    loginAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.frame.origin.x, self.frame.origin.y + 50)];
    loginAnimation.duration = 0.5;
    loginAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    loginAnimation.repeatCount = NSNotFound;
    loginAnimation.autoreverses = YES;
    loginAnimation.fillMode = kCAFillModeBackwards;
    [self.layer addAnimation:loginAnimation forKey:@"loginIcon"];

}

- (void)LoginSucceedCompletion:(LoginAnimation)completion {
    
}

- (void)LoginFailedCompletion:(LoginAnimation)completion {
    
}

- (void)revert {
    
}
- (void)didStopAnimation {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
