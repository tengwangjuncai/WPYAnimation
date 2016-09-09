//
//  WPY3DCubeAnimationView.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/31.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPY3DCubeAnimationView.h"

@implementation WPY3DCubeAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCube];
        }
    return self;
}

- (void)createCube {
    
    CATransformLayer *contentLayer = [CATransformLayer layer];
    contentLayer.frame =self.layer.bounds;
    CGSize size = contentLayer.bounds.size;
    contentLayer.transform = CATransform3DMakeTranslation(size.width / 2, size.height / 2, 0);
    self.contentLayer = contentLayer;
    [self.layer addSublayer:contentLayer];
    
    self.topBtn = [self layerAtX:0 Y:-50 Z:0 Color:[UIColor redColor] Transform:CATransform3DMakeRotation(M_PI_2, 1, 0, 0)];
    self.bottomBtn = [self layerAtX:0 Y:50 Z:0 Color:[UIColor greenColor] Transform:CATransform3DMakeRotation(M_PI_2, 1, 0, 0)];
    self.leftBtn = [self layerAtX:-50 Y:0 Z:0 Color:[UIColor blueColor] Transform:CATransform3DMakeRotation(M_PI_2, 0, 1, 0)];
    self.rightBtn = [self layerAtX:50 Y:0 Z:0 Color:[UIColor brownColor] Transform:CATransform3DMakeRotation(M_PI_2, 0, 1, 0)];
    self.frontBtn = [self layerAtX:0 Y:0 Z:50 Color:[UIColor orangeColor] Transform:CATransform3DIdentity];
    self.backBtn = [self layerAtX:0 Y:0 Z:-50 Color:[UIColor yellowColor] Transform:CATransform3DIdentity];
}

- (void)addTarget:(id)target Action:(SEL)action {
    
    [self.topBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.frontBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
   
}

//- (void)addPanGesture:(UIView *)view {
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//    [view addGestureRecognizer:pan];
//}
- (void)pan:(UIPanGestureRecognizer *)recognizer{
    //获取到的是手指移动后，在相对坐标中的偏移量(以手指接触屏幕的第一个点为坐标原点)
    CGPoint translation = [recognizer translationInView:self];
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, translation.x * 1 / 100, 0, 1, 0);
    transform = CATransform3DRotate(transform, translation.y * - 1 / 100, 1, 0, 0);
    self.layer.sublayerTransform = transform;
   
}

- (UIButton *)layerAtX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z Color:(UIColor *)color Transform:(CATransform3D)transform {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn.bounds = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = color;
    btn.layer.position = CGPointMake(x, y);
   btn.layer.zPosition = z;
    btn.layer.transform = transform;
   // [self addSubview:btn];
    [self.contentLayer addSublayer:btn.layer];
    
    return btn;
}

- (void)btnClicked:(UIButton *)btn {
    NSLog(@"你他妈点我干啥？");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
