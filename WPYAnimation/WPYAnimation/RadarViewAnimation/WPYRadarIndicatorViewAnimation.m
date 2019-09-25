//
//  WPYRadarIndicatorViewAnimation.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/20.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYRadarIndicatorViewAnimation.h"

@implementation WPYRadarIndicatorViewAnimation

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawArc:context];
}

//画大扇形

-(void)drawArc:(CGContextRef)context {
    //将坐标移到视图中心
    CGContextTranslateCTM(context, CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
    
    //设置扇形半径
    CGFloat radius = CGRectGetWidth(self.frame)/2.0;
    CGContextSetLineWidth(context, 0.1);//设置图形上下文的线宽。
    // 默认线宽为1个单位。当描边时，线跨过路径，两侧的总宽度的一半。
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGFloat single = M_PI / 180/2.0;//画图时每次旋转的度数
    CGFloat colorAlpha = M_PI_2/90/2;
    CGFloat x = 0.0;
    for (int i = 0; i < 90 * 2; i++) {
        //画小扇形
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddArc(context, 0, 0, radius, 0, -single, YES);
        /*
         将当前路径的圆弧添加到当前路径，可能在前面加上直线段
         弧是以点（x，y）为中心的半径r的圆的线段。调用此函数时，您将提供中心点，半径和两个以弧度为单位的角度。 Core Graphics使用此信息确定弧的终点，然后使用一系列三次贝塞尔曲线近似新弧。顺时针参数确定电弧的创建方向;最终路径的实际方向取决于图形上下文的当前变换矩阵。例如，在iOS上，UIView通过将Y值缩放-1来翻转Y坐标。在翻转的坐标系中，指定顺时针弧将导致应用变换后的逆时针弧。
         如果当前路径已包含子路径，则添加将当前点连接到弧的起点的线。如果当前路径为空，Core Graphics将创建一个新的子路径，并将起点设置为弧的起点。
         弧的终点变为路径的新当前点
         */

        //设置填充颜色以及透明度
        x = x + colorAlpha;
        CGFloat alpha = sin(1 - x);//用三角函数 实现透明度随角度变化而变化
        UIColor * color = [UIColor colorWithRed:41/255.0 green:253/255.0 blue:47/255.0 alpha:alpha];
        [color setFill];//将后续填充操作的颜色设置为接收器的颜色。否则  颜色不会发生改变
        //        如果你子类化UIColor，你必须在你的子类中实现这个方法。您的自定义实施应通过将其设置为接收器表示的颜色来修改当前图形上下文中的填充颜色。
        
        CGContextFillPath(context);//使用非零匝数规则绘制当前路径中的区域。
        [color setStroke];//将后续笔画操作的颜色设置为接收器表示的颜色。 同上setFill
        
        CGContextClosePath(context);//关闭并终止当前路径的子路径。将当前点的线追加到当前子路径的起点，并结束子路径。关闭子路径后，您的应用程序可以开始一个新的子路径，而无需先调用CGContextMoveToPoint。
        CGContextDrawPath(context, kCGPathFillStroke);////使用提供的绘图模式绘制当前路径。路径
        
        //逆时针旋转坐标轴
        CGContextRotateCTM(context, -single);//如果不动坐标轴所有的小扇形就会重叠，就像一条线了
    }
}

- (void)start {
    [self setNeedsDisplay];//通知系统您的视图的内容需要重绘。此方法记下请求并立即返回。在下一个绘制周期之前，实际上不会重绘视图，此时所有无效视图都会更新。
    //它仅适用于使用本机绘图技术（例如UIKit和Core Graphics）呈现其内容的视图
    
    //添加旋转动画
    CABasicAnimation * rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(2 * M_PI);
    rotationAnimation.duration = 6;
    rotationAnimation.repeatCount = NSUIntegerMax;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stop {
    
    [self.layer removeAnimationForKey:@"rotationAnimation"];
}
@end
