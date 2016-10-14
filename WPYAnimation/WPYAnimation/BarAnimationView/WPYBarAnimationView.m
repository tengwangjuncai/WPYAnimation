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
        view.tag = i + 10;
        [self addSubview:view];
    }
}

- (void)startAnimation {
    for (int i = 0; i < self.numberOfItem; i++) {
        [self addAnimationWithItemIndex:i];
    }
}

- (void)stopAnimation {
    self.isStop = YES;
}

//个人感觉这个适合做实时动态变化的展示 （如 利用音频高低来模仿音频的高低）

- (void)addAnimationWithItemIndex:(NSInteger)index {
    UIView * view = [self viewWithTag:index + 10];
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
        if (!_isStop) {
           [self addAnimationWithItemIndex:index];
        }
    }];
}
@end
