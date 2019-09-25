//
//  WPYRadarViewAmimation.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/20.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYRadarViewAmimation.h"
#import "WPYRadarIndicatorViewAnimation.h"

#define OuterInterval 20
#define InnerInterval 10
#define NUM 4
@interface WPYRadarViewAmimation()

@property (nonatomic, strong)WPYRadarIndicatorViewAnimation * indicatorView;
@property (nonatomic, assign) CGFloat interval;
@end
@implementation WPYRadarViewAmimation

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.interval = (CGRectGetWidth(frame) - InnerInterval)/(NUM * 2 +1);
        [self addSubview:self.indicatorView];
    }
    return self;
}

- (WPYRadarIndicatorViewAnimation *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[WPYRadarIndicatorViewAnimation alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame) - OuterInterval-2, CGRectGetWidth(self.frame) - OuterInterval-2)];
        _indicatorView.center = self.center;
    }
    return _indicatorView;
}

- (void)drawCircle:(CGContextRef)context {
    
    //将坐标轴移到视图中心
    CGContextTranslateCTM(context, CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(context, 2);
    
    //画圆弧
    for (int i = 1; i <= NUM; i++) {
        CGContextMoveToPoint(context, InnerInterval +  i * self.interval, 0);
        CGContextAddArc(context, 0, 0, InnerInterval + i * self.interval, 0, 2 * M_PI, 0);
    }
    CGContextStrokePath(context);
    
    //画十字坐标
    CGContextMoveToPoint(context, -NUM * self.interval - InnerInterval, 0);
    CGContextAddLineToPoint(context, self.interval * NUM + InnerInterval, 0);
    
    CGContextMoveToPoint(context, 0, -NUM * self.interval - InnerInterval);
    CGContextAddLineToPoint(context, 0, self.interval * NUM + InnerInterval);
    
    CGContextStrokePath(context);
}

// 开始扫描
- (void)radarScan {
    [self.indicatorView start];
}

// 停止扫描
- (void)stopScan {
    [self.indicatorView stop];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef  context = UIGraphicsGetCurrentContext();
    [self drawCircle:context];
}


@end
