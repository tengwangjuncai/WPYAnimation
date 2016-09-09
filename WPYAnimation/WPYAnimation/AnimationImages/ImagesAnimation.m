//
//  ImagesAnimation.m
//  WPYAnimation
//
//  Created by wpy on 16/8/1.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "ImagesAnimation.h"


@interface ImagesAnimation ()

@end

@implementation ImagesAnimation


+ (ImagesAnimation *)imagesAnimationViewWithImageNameArray:(NSArray *)imageNames frame:(CGRect)frame animationDuration:(NSTimeInterval)interval {
    
    ImagesAnimation * imageView = [[ImagesAnimation alloc] initWithFrame:frame];
    
    NSMutableArray * images = [NSMutableArray array];
    for (int i = 0; i< imageNames.count; i++) {
        UIImage *image = [UIImage imageNamed:imageNames[i]];
        [images addObject:image];
    }
    imageView.duration = interval;
    imageView.animationImages = images;
    imageView.animationDuration = imageView.duration;
    [imageView startAnimating];
    return imageView;
}

/**
 *  设置 时间间隔  同事再次开始提交动画
 *
 *  @param duration 时间间隔
 */
- (void)setDuration:(NSTimeInterval)duration {
    _duration = duration;
    self.animationDuration = _duration;
    [self startAnimating];
}

/**
 *  创建定时器
 *
 *  @param time      时间间隔
 *  @param userInfo  信息
 *  @param repeat    是否重复
 *  @param cLocation 改变位置的Block
 */
- (void)createTimerWithInterval:(NSTimeInterval)time userInfo:(id)userInfo repeats:(BOOL)repeat ChangeLocation:(ChangeLocation)cLocation {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(changeTime:) userInfo:userInfo repeats:repeat];
    self.cLocation = cLocation;
}

/**
 *  实时的改变位置
 *
 *  @param timer 定时器
 */
- (void)changeTime:(NSTimer *)timer {
    self.cLocation(timer);
}/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
