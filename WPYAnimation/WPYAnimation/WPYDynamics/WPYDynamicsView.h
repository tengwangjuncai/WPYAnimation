//
//  WPYDynamicsView.h
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/12/6.
//  Copyright © 2016年 wpy. All rights reserved.
//


/*要想使用UIDynamic来实现物理仿真效果，大致的步骤如下
 
 （1）创建一个物理仿真器（顺便设置仿真范围）
 
 （2）创建相应的物理仿真行为（顺便添加物理仿真元素）
 
 （3）将物理仿真行为添加到物理仿真器中  开始仿真
 
 1）谁要进行物理仿真？
 　　物理仿真元素（Dynamic Item）
 （2）执行怎样的物理仿真效果？怎样的动画效果？
 
 　　物理仿真行为（Dynamic Behavior）
 （3）让物理仿真元素执行具体的物理仿真行为
 
 　　物理仿真器（Dynamic Animator）
 */
#import <UIKit/UIKit.h>

typedef void(^TapBlock) ();
@interface WPYDynamicsView : UIView

@property (nonatomic,strong)CAShapeLayer *lineLayer;
@property (nonatomic,assign)CGFloat lineLength;
@property (nonatomic, strong)UIColor *lineColor;
@property (nonatomic,assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat damping;
@property (nonatomic,strong)  UIGravityBehavior *gravity;//重力行为
@property (nonatomic,strong) UIAttachmentBehavior *attach;//附着行为
@property (nonatomic,strong) UIDynamicItemBehavior *itemBehavior;//动力元素行为
@property (nonatomic,strong) UICollisionBehavior *collision;//碰撞行为

@property (nonatomic,copy)TapBlock tapBlock;

- (void)setUpWithAnchor:(CGPoint)anchor inView:(UIView *)view;
@end
