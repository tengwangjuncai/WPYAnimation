//
//  WPYBarAnimationView.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/13.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYBarAnimationView.h"

@interface WPYBarAnimationView()

@property (nonatomic, assign) BOOL isStop;
@end
@implementation WPYBarAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    if (!self.numberOfItem) {
         self.numberOfItem = 40;
    }
    if (!self.paddingOfItem) {
        self.paddingOfItem = 2.0;
    }
    if (!self.paddingOfSide) {
        self.paddingOfSide = 2.0;
    }
    if (!self.tintColor) {
        self.tintColor = [UIColor colorWithRed:1.000 green:0.648 blue:0.140 alpha:1.000];
    }
    
    [self createItems];
    
}

- (void)createItems {
    CGFloat itemWidth = (self.bounds.size.width - 2.0 * self.paddingOfSide - (self.numberOfItem -1) * self.paddingOfItem)/self.numberOfItem;
    for (int i= 0; i < self.numberOfItem; i++) {
        CGRect frame = CGRectMake(_paddingOfSide + i * (itemWidth + _paddingOfItem), self.bounds.size.height - 1.0, itemWidth, 1);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = _tintColor;
        view.tag = i + 100;
        [self addSubview:view];
    }
}
//暂停（单个）动画
- (void)pauseLayer:(CALayer *)layer {
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

//恢复（单个）动画
- (void)resumeLayer:(CALayer *)layer {
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePuse = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePuse;
}

- (void)startAnimation {
    for (int i = 0; i < self.numberOfItem; i++) {
        if (!_isStop) {
            [self addAnimationWithItemIndex:i];
        }else {
            WPYBarAnimationView * view = [self viewWithTag:i + 100];
            [self resumeLayer:view.layer];
        }
    }
    
}

- (void)stopAnimation {
    self.isStop = YES;
    if (!_isStop) {
        self.isStop = YES;
    }
    for (int i = 0; i< _numberOfItem ; i ++) {
        WPYBarAnimationView * view = [self viewWithTag:i + 100];
        [self pauseLayer:view.layer];
    }
}
- (void)removeAnimation {
    for (int i = 0; i< _numberOfItem ; i ++) {
        WPYBarAnimationView * view = [self viewWithTag:i + 100];
        [view.layer removeAllAnimations];
    }
    self.isStop = NO;
}
//个人感觉这个适合做实时动态变化的展示 （如 利用音频高低来模仿音频的高低）

- (void)addAnimationWithItemIndex:(NSInteger)index {
    UIView * view = [self viewWithTag:index + 100];
    NSInteger randomNum = arc4random()%90 + 5;
    CGFloat preHeight = view.frame.size.height;
    CGFloat currentHeight = self.bounds.size.height * randomNum/100;
    NSInteger randomDuration = arc4random()%40 + 10;
    
    [UIView animateWithDuration:randomDuration/100.0 delay:0.0 options:preHeight >= currentHeight ? UIViewAnimationOptionCurveEaseOut : UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGRect frame = view.frame;
        frame.size.height = currentHeight;
        frame.origin.y = self.bounds.size.height - frame.size.height;
        view.frame = frame;

    } completion:^(BOOL finished) {
           [self addAnimationWithItemIndex:index];
    
    }];
}
@end
