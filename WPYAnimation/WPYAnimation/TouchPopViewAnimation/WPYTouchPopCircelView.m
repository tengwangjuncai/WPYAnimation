//
//  WPYTouchPopCircelView.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYTouchPopCircelView.h"

@interface WPYTouchPopCircelView()


@property (nonatomic, strong)UIBezierPath *path;
@property (nonatomic)CGPoint beginPoint;
@property (nonatomic)CGPoint endPoint;
@property (nonatomic, strong)CAShapeLayer *shapeLayer;
@property (nonatomic, assign)BOOL isTouchEnd;
@property (nonatomic, assign)int currentFrame;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, strong)CADisplayLink * displayLink;
@end
@implementation WPYTouchPopCircelView



- (void)setFrame:(CGRect)frame withSuperView:(UIViewController *)superVC {
    self.frame = frame;
    self.superVC = superVC;
    self.width = MIN(frame.size.width, frame.size.height);
    [self setUp];
}
- (void)setUp{
    _shapeLayer = [CAShapeLayer layer];
    [self.superVC.view.layer addSublayer:_shapeLayer];
    _shapeLayer.fillColor = [UIColor yellowColor].CGColor;
    _shapeLayer.strokeColor  = [UIColor redColor].CGColor;
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateFrame)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)updateFrame {
    _path = [UIBezierPath bezierPathWithArcCenter:_beginPoint radius:[self getRadius] startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [_path setLineWidth:10.0];
    [_path closePath];
    _shapeLayer.path = _path.CGPath;
}

- (CGFloat)getSpringInterpolation:(CGFloat)x {
    CGFloat tension = 0.3;
    return pow(2,-10 * x) *sin((x - tension/4) * (2 * M_PI)/tension);
}
- (CGFloat)getRadius {
    CGFloat result = sqrt(pow(_endPoint.x - _beginPoint.x,2) + pow(_endPoint.y - _beginPoint.y, 2));
    if (_isTouchEnd) {
        CGFloat animationDuration = 1.0;
        int maxFrames = animationDuration / _displayLink.duration;
        _currentFrame++;
        if (_currentFrame <= maxFrames) {
            CGFloat factor = [self getSpringInterpolation:(CGFloat)(_currentFrame) / (CGFloat)(maxFrames)];
            return self.width + (result - self.width) * factor;
        }else {
            return self.width;
        }
    }
    return result;
}
- (void)touchBegan:(NSSet<UITouch *> *)touches {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    _beginPoint = point;
    _endPoint = point;
    _isTouchEnd = NO;
    _currentFrame = 1;
}
- (void)touchMove:(NSSet<UITouch *> *)touches {
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    _endPoint = point;
}

-  (void)touchEnd:(NSSet<UITouch *> *)touches {
    _isTouchEnd = YES;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
