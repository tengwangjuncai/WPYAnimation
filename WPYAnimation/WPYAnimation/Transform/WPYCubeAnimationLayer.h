//
//  WPYCubeAnimationLayer.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/31.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface WPYCubeAnimationLayer : CATransformLayer

@property (nonatomic, strong)CATransformLayer  *contentLayer;

@property (nonatomic, strong)CALayer *topLayer;

@property (nonatomic, strong)CALayer *bottomLayer;

@property (nonatomic, strong)CALayer *leftLayer;

@property (nonatomic, strong)CALayer *rightLayer;

@property (nonatomic, strong)CALayer *frontLayer;

@property (nonatomic, strong)CALayer *backLayer;

- (CALayer *)layerAtX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z Color:(UIColor *)color Transform:(CATransform3D)transform;
@end
