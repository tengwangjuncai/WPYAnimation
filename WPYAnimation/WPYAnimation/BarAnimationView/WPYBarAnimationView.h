//
//  WPYBarAnimationView.h
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/13.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYBarAnimationView : UIView
@property (nonatomic, assign) NSInteger numberOfItem;

@property (nonatomic, assign) CGFloat paddingOfItem;

@property (nonatomic, assign) CGFloat paddingOfSide;

@property (nonatomic, strong) UIColor *tintColor;

//只有执行此方法才能完成图形创建（其他的没有实现 如有需要  自己到里面修改）
- (instancetype)initWithFrame:(CGRect)frame;

// 可以用这个方法来合适的时间来开始动画
- (void)startAnimation;

// 停止动画
- (void)stopAnimation;

@end
