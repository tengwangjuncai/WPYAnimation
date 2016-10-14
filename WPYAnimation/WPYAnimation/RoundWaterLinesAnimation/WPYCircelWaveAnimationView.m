//
//  WPYCircelWaveAnimationView.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/14.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYCircelWaveAnimationView.h"

#import "WPYCircleView.h"
#define BLUE_COLOR
@interface WPYCircelWaveAnimationView()

@property (nonatomic, assign) BOOL isStop;
@property (nonatomic, assign) NSInteger lastdelay;

@property (nonatomic, assign) CGFloat AnimationDelay;
@end
@implementation WPYCircelWaveAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    if (!self.numberOfItem) {
        _numberOfItem = 10;
    }
    
    if (!self.circleColor) {
        _circleColor =[self colorWithHex:0xFF2C9AFE];
    }
    if (!self.AnimationDelay) {
        self.AnimationDelay = 0.5;
    }
    [self createItems];
    
}


- (void)setTintColor:(UIColor *)tintColor {
    
    _circleColor = tintColor;
    
    for (int i =0; i < _numberOfItem; i++) {
        UIView *view = [self viewWithTag:i + 100];
        view.backgroundColor = _circleColor;
    }
}

- (void)createItems {
    for (int i = 0; i< _numberOfItem; i++) {
        CGRect frame = CGRectZero;
        WPYCircleView * view = [[WPYCircleView alloc] initWithFrame:frame];
        view.backgroundColor = [UIColor clearColor];
        view.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height/2.0);
        view.alpha = 0.9;
        view.tintColor = [UIColor blueColor];
        view.circelColor = _circleColor;
        view.tag = i + 100;
        view.delay = i * self.AnimationDelay;
        [self addSubview:view];
    }
    self.lastdelay = _numberOfItem * self.AnimationDelay;
}

- (void)startAnimation {
    for (int i = 0; i < _numberOfItem; i++) {
        [self addAnimationWithItemIndex:i];
    }
}

- (void)stopAnimation {
    self.isStop = YES;
    for (int i = 0; i< _numberOfItem ; i ++) {
        WPYCircleView * view = [self viewWithTag:i + 100];
        [view.layer  removeAllAnimations];
    }
   }
- (void)addAnimationWithItemIndex:(NSInteger)index {
    WPYCircleView * view = [self viewWithTag:index + 100];
    [UIView animateWithDuration:3.0 delay:view.delay  options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect frame = view.frame;
        frame.size.height = self.bounds.size.height;
        frame.size.width = self.bounds.size.height;
        view.frame = frame;
        view.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
        view.alpha = 0.0;
        [view setNeedsDisplay];
    } completion:^(BOOL finished) {
        view.alpha = 0.9;
        view.frame = CGRectZero;
        view.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
            view.delay = self.lastdelay - 3 + self.AnimationDelay;
            self.lastdelay = view.delay;
        if (!self.isStop) {
            [self addAnimationWithItemIndex:index];
        }
        
    }];
}
- (UIColor *)colorWithHex:(NSUInteger)hex
{
    NSUInteger a = (hex >> 24) & 0xFF;
    NSUInteger r = (hex >> 16) & 0xFF;
    NSUInteger g = (hex >> 8 ) & 0xFF;
    NSUInteger b = hex & 0xFF;
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a / 255.0f];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
