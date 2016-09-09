//
//  WPYTransitionAnimation.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/8.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface WPYTransitionAnimation : CATransition

/**
 *  填好相应参数直接返回animation 放在需要动画的视图的layer 上即可
 *
 *  @param functionName 改变动画的快慢变化
 
        *  动画的开始与结束的快慢,有五个预置分别为(下同):
        1  kCAMediaTimingFunctionLinear            线性,即匀速
        2  kCAMediaTimingFunctionEaseIn            先慢后快
        3  kCAMediaTimingFunctionEaseOut           先快后慢
        4  kCAMediaTimingFunctionEaseInEaseOut     先慢后快再慢
        5  kCAMediaTimingFunctionDefault           实际效果是动画中间比较快.
 
 
 *  @param type         动画的类型
        1 @"cube"－ 立方体效果  
        2 @"suckEffect"－收缩效果，如一块布被抽走   
        3 @"oglFlip"－上下翻转效果
        4 @"rippleEffect"－滴水效果  
        5 @"pageCurl"－向上翻一页  
        6 @"pageUnCurl"－向下翻一页 
        7 @"rotate" 旋转效果 
        8 @"cameraIrisHollowOpen"     相机镜头打开效果(不支持过渡方向)  
        9 @"cameraIrisHollowClose"    相机镜头关上效果(不支持过渡方向)
        //动画类型
        10 kCATransitionFade    新视图逐渐显示在屏幕上，旧视图逐渐淡化出视野
        11 kCATransitionMoveIn  新视图移动到旧视图上面，好像盖在上面
        12 kCATransitionPush    新视图将旧视图退出去
        13 kCATransitionReveal  将旧视图移开显示下面的新视图
 
 *  @param subtype      子视图的动画类型
        1 kCATransitionFade
        2 kCATransitionMoveIn
        3 kCATransitionPush
        4 kCATransitionReveal
        5 kCATransitionFromRight
        6 kCATransitionFromLeft
        7 kCATransitionFromTop
        8 kCATransitionFromBottom
 
        如果 type 类型为  7 @"rotate" 旋转效果 subtype 有如下类型
        *  90cw    逆时针旋转90°
        *  90ccw   顺时针旋转90°
        *  180cw   逆时针旋转180°
        *  180ccw  顺时针旋转180°
        *  @param duration     动画的执行时间 （自己定义）
 *
 *  @return 动画 animation  放在需要动画的视图的layer 上即可
 */
+ (WPYTransitionAnimation *)createTransitionAnimationWithFunctionName:(NSString *)functionName Type:(NSString *)type SubType:(NSString *)subtype Duration:(CFTimeInterval)duration;

//由于系统类型繁多，所以没有一一写出方法，这就要你事先知道有哪些类型，进行选择。但是用这个方法可以直接得到一个animation  可以在要加动画的视图上直接使用
@end
