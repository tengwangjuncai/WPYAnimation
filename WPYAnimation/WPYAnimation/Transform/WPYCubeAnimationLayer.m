//
//  WPYCubeAnimationLayer.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/31.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYCubeAnimationLayer.h"

@implementation WPYCubeAnimationLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.topLayer = [self layerAtX:0 Y:-50 Z:0 Color:[UIColor redColor] Transform:CATransform3DMakeRotation(M_PI_2, 1, 0, 0)];
        self.bottomLayer = [self layerAtX:0 Y:50 Z:0 Color:[UIColor greenColor] Transform:CATransform3DMakeRotation(M_PI_2, 1, 0, 0)];
        self.leftLayer = [self layerAtX:-50 Y:0 Z:0 Color:[UIColor blueColor] Transform:CATransform3DMakeRotation(M_PI_2, 0, 1, 0)];
        self.rightLayer = [self layerAtX:50 Y:0 Z:0 Color:[UIColor blackColor] Transform:CATransform3DMakeRotation(M_PI_2, 0, 1, 0)];
        self.frontLayer = [self layerAtX:0 Y:0 Z:50 Color:[UIColor cyanColor] Transform:CATransform3DIdentity];
        self.backLayer = [self layerAtX:0 Y:0 Z:-50 Color:[UIColor yellowColor] Transform:CATransform3DIdentity];
    }
    return self;
}

- (CALayer *)layerAtX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z Color:(UIColor *)color Transform:(CATransform3D)transform {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = color.CGColor;
    layer.bounds  = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(x, y);
    layer.zPosition = z;
    layer.transform = transform;
    [self addSublayer:layer];
    
    return layer;
}
@end
