//
//  ViewAnimation.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "ViewAnimation.h"

@implementation ViewAnimation

/**
 *  创建背景动画
 *
 *  @param image    背景移动的image
 *  @param width    imageWidth
 *  @param interval 时间间隔
 *  @param type     背景动画类型
 *  @param frame    背景的frame
 *
 *  @return 返回背景view
 */
- (void)createBgAnimationWithAnimationImage:(UIImage *)image ImageWidth:(CGFloat)width TimeInterval:(NSTimeInterval)interval bgAnimationType:(backgroundViewAnimationType)type BgViewFrame:(CGRect)frame {
    self.frame = frame;
    self.animationImage = image;
    if (width == 0) {
        self.width = 50;
    }else {
        self.width = fabs(width);
    }
    self.interval = interval;
    self.bgViewType = type;
    [self createTimer];
}
/**
 *  创建定时器
 */
- (void)createTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(changeTime:) userInfo:nil repeats:YES];
}

/**
 *  不同类型的背景动画要在一定的时间间隔里执行不同的 方法
 *
 *  @param timer 定时器  （来判定不同的定时器）
 */
-(void)changeTime:(NSTimer *)timer {
    if (self.bgViewType == 0) {
        [self snowType];
    }else if (self.bgViewType == 1) {
        [self bubbleType];
    }
}

/**
 *  雪花类型的背景动画
 */
- (void)snowType {
   
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake((arc4random()%(int)self.frame.size.width), -_width, _width, _width)];
    imageView.image = self.animationImage;
    [self addSubview:imageView];
    [UIView  animateWithDuration:5.0 animations:^{
        CGRect temp = imageView.frame;
        temp.origin.y = self.frame.size.height-_width;
        temp.origin.x = arc4random()%(int)self.frame.size.width;
        imageView.frame =temp;
       
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:(2) animations:^{
            imageView.alpha = 0;
        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
        }];
    }];

}


/**
 *  泡沫类型的背景动画
 */
- (void)bubbleType {
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake((arc4random()%(int)self.frame.size.width), self.frame.size.height, _width, _width)];
    imageView.image = self.animationImage;
    [self addSubview:imageView];
    [UIView  animateWithDuration:5.0 animations:^{
        CGRect temp = imageView.frame;
        temp.origin.y = -_width;
        temp.origin.x = arc4random()%(int)self.frame.size.width;
        imageView.frame =temp;
        imageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
        imageView.alpha = 0.3;
    } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
    }];

}
@end
