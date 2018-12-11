//
//  WPYLoginIcon.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYLoginIcon.h"

@implementation WPYLoginIcon

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        self.maskView.backgroundColor = [UIColor whiteColor];
        self.maskView.alpha = 0;
        [self addSubview:self.maskView];
    }
    return self;
}

- (void)beginLoginAnimation {
    
    
    CABasicAnimation *loginAnimation = [CABasicAnimation animation];
    loginAnimation.keyPath = @"position";
    loginAnimation.fromValue = [NSValue valueWithCGPoint:self.center];
    loginAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x,self.center.y + 50)];
    loginAnimation.duration = 0.5;
    loginAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    loginAnimation.repeatCount = NSNotFound;
    loginAnimation.autoreverses = NO;
    loginAnimation.fillMode = kCAFillModeBackwards;
    [self.layer addAnimation:loginAnimation forKey:@"loginIcon"];

}

- (void)LoginSucceedCompletion:(LoginAnimation)completion {
    _handle = completion;
    
    CABasicAnimation * alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.toValue = @(0);
    alphaAnimation.duration = 0.1f;
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    alphaAnimation.removedOnCompletion = NO;
    alphaAnimation.fillMode = kCAFillModeForwards;
    alphaAnimation.delegate = self;
    [self.layer addAnimation:alphaAnimation forKey:alphaAnimation.keyPath];
}

- (void)LoginFailedCompletion:(LoginAnimation)completion {
    _handle = completion;
    self.maskView.alpha = 0.5;
    [self.layer removeAllAnimations];
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPoint point = self.layer.position;
    
    keyFrameAnimation.values = @[[NSValue valueWithCGPoint:CGPointMake(point.x, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x , point.y - 20)],[NSValue valueWithCGPoint:CGPointMake(point.x , point.y + 20)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y - 20)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y + 20)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y - 20)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y + 20)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y - 20)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y + 20)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y - 20)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y + 20)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y)]];
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    keyFrameAnimation.duration = 1.0f;
    keyFrameAnimation.delegate = self;
    self.layer.position = point;
    [self.layer addAnimation:keyFrameAnimation forKey:keyFrameAnimation.keyPath];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    CABasicAnimation * animation = (CABasicAnimation *)anim;
    if ([animation.keyPath isEqualToString:@"alpha"]) {
        if (_handle) {
            
            self.handle();
            [self.layer removeAllAnimations];
        }
    }else if ([animation.keyPath isEqualToString:@"position"]) {
        if (_handle) {
            self.handle();
        }
         [self.layer removeAllAnimations];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(didStopAnimation) userInfo:nil repeats:NO];
    }

}
- (void)revert {
    
}
- (void)didStopAnimation {
   
    self.maskView.alpha = 0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
