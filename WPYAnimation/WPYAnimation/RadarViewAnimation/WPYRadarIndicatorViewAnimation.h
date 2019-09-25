//
//  WPYRadarIndicatorViewAnimation.h
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/20.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYRadarIndicatorViewAnimation : UIView

//创建对象要用此方法 其实方法中为实现初始化
- (instancetype)initWithFrame:(CGRect)frame;

-(void)start;//开始动画

-(void)stop;//停止动画
@end
