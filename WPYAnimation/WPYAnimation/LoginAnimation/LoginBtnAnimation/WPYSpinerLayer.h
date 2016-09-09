//
//  WPYSpinerLayer.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/25.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface WPYSpinerLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame;

- (void)beginAnimation;

- (void)stopAnimation;
@end
