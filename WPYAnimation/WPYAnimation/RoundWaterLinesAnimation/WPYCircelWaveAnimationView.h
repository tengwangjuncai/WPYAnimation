//
//  WPYCircelWaveAnimationView.h
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/14.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYCircelWaveAnimationView : UIView

@property (nonatomic,strong) UIColor * circleColor;

@property (nonatomic,assign) NSInteger numberOfItem;

//只有实现该方法才能初始化波纹动画（因为实现了这个方法，如果有需要自行修改）
- (instancetype)initWithFrame:(CGRect)frame;


- (void)startAnimation;
- (void)stopAnimation;
//彻底删除动画
- (void)removeAnimation;
@end
