//
//  WPYTransition.h
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

//https://onevcat.com/2013/10/vc-transition-in-ios7/  在这里是王魏对iOS7后出现的自定义转场动画做比较详细的讲解，如果你想要进一步的研究可以进去看看相信可以学到很多。
//关于转场的真正操作只需要遵守协议 UIViewControllerAnimatedTransition
//实现两个方法：1 - (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext 在这里设定转场所用时间
//            2 - (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext 具体的转场操作在这而函数中实现就可以了

#import <UIKit/UIKit.h>

//自定义转场的枚举类型
typedef NS_ENUM(NSUInteger, WPYCTransitionType) {
    
    WPYMagicTransitionTypePush = 0,
    WPYMagicTransitionTypePop, 
    
    WPYPopTransitionPresent,
    WPYPopTransitionDismiss,
    
    WPYPageCoverTransitionPush,
    WPYPageCoverTransitionPop,
    
    WPYCircleSpreadTransitionPresent,
    WPYCircleSpreadTransitionDismiss,
    
    WPYPrintPaperTransitionPresent,
    WPYPrintPaperTransitionDismiss
    
};
@interface WPYTransition : NSObject<UIViewControllerAnimatedTransitioning,CAAnimationDelegate>

//转场类型 根据不同的转场类型进行不同的转场操作
@property (nonatomic, assign) WPYCTransitionType type;

//设定转场类型
+ (instancetype)WPYCtransitionWithTransitionType:(WPYCTransitionType)type;
@end
