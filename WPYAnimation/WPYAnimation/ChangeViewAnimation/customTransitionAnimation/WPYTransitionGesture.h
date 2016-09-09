//
//  WPYTransitionGesture.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/9.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

//UIViewControllerInteractiveTransitioning接口的类，为我们预先实现和提供了一系列便利的方法，可以用一个百分比来控制交互式切换的过程。一般来说我们更多地会使用某些手势来完成交互式的转移（当然用的高级的话用其他的输入..比如声音，iBeacon距离或者甚至面部微笑来做输入驱动也无不可，毕竟想象无极限嘛..），这样使用这个类（一般是其子类）的话就会非常方便。我们在手势识别中只需要告诉这个类的实例当前的状态百分比如何，系统便根据这个百分比和我们之前设定的迁移方式为我们计算当前应该的UI渲染，十分方便。具体的几个重要方法：

//这个过渡方式也可以不要的，可以直接完成转场，但是那样的话用户体验就会很不好，自定义转场动画意义不大。所以一般是要进行手势过渡的

typedef void(^WPYGesture)(void);

typedef NS_ENUM(NSUInteger, WPYTransitionGestureDirection) {//方向
    WPYTransitionGestureDirectionLeft = 0,
    WPYTransitionGestureDirectionRight,
    WPYTransitionGestureDirectionUp,
    WPYTransitionGestureDirectionDown
};

typedef NS_ENUM(NSUInteger, WPYTransitionType) {//转场
    WPYTransitionTypePresent = 0,
    WPYTransitionTypeDismiss,
    WPYTransitionTypePush,
    WPYTransitionTypePop,
};


@interface WPYTransitionGesture : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL isStart;//记录手势是否开始   手势触发/返回触发

@property (nonatomic, copy) WPYGesture present;//配置present 的控制器

@property (nonatomic, copy) WPYGesture push;//配置 要 push 的控制器

@property (nonatomic, weak) UIViewController *vc;

@property (nonatomic, assign) WPYTransitionGestureDirection direction;

@property (nonatomic, assign) WPYTransitionType type;


/**
 *  创建 转场对象的类方法
 *
 *  @param type      转场类型
 *  @param direction 转场手势类型
 *
 *  @return 转场对象
 */
+ (instancetype)WPYTransitionWithTransitionType:(WPYTransitionType)type GestureDirection:(WPYTransitionGestureDirection)direction;

/**
 *  给控制器界面添加手势
 *
 *  @param VC 控制器
 */
- (void)addPanGestureForViewController:(UIViewController *)VC;//给控制器添加手势
@end
