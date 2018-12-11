//
//  WPYTransitionGesture.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYTransitionGesture.h"

@implementation WPYTransitionGesture


+ (instancetype)WPYTransitionWithTransitionType:(WPYTransitionType)type GestureDirection:(WPYTransitionGestureDirection)direction {
    return [[self alloc] initWithTransitionType:type GestureDirection:direction];
}

/**
 *  初始化对象的方法
 *
 *  @param type      转场类型
 *  @param direction 转场手势的方向
 *
 *  @return
 */
- (instancetype)initWithTransitionType:(WPYTransitionType)type GestureDirection:(WPYTransitionGestureDirection)direction {
    self = [super init];
    if (self) {
        self.direction = direction;
        self.type = type;
    }
    return self;
}

/**
 *  给控制器添加手势 其实是给其上的view 添加
 *
 *  @param VC 需要添加手势的VC
 */
- (void)addPanGestureForViewController:(UIViewController *)VC {
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    self.vc = VC;
    [VC.view addGestureRecognizer:pan];
}

/**
 *  随着手势的变化，让转场也随之过度操作
 *
 *  @param pan 手势
 */
- (void)handlePanGesture:(UIPanGestureRecognizer *)pan {
    
    CGFloat value;
    CGFloat width = pan.view.frame.size.width;
    switch (self.direction) {
            
        case WPYTransitionGestureDirectionLeft:
        {
            CGFloat transitionX = -[pan translationInView:pan.view].x;
            value = transitionX / width;
        }
            break;
        case WPYTransitionGestureDirectionRight:
        {
            CGFloat transitionX = [pan translationInView:pan.view].x;
            value = transitionX / width;
        }
            break;
        case WPYTransitionGestureDirectionUp:
        {
            CGFloat transitionY = -[pan translationInView:pan.view].y;
            value = transitionY / width;
        }
            break;
        case WPYTransitionGestureDirectionDown:
        {
            CGFloat transitionY = [pan translationInView:pan.view].y;
            value = transitionY / width;
        }
            break;
        default:
            break;
    }
    
    switch (pan.state) {
            
            //手势开始 可以在这里设置手势开始后的操作
        case UIGestureRecognizerStateBegan:
        {
            self.isStart = YES;
            [self startGesture];
        }
            break;
            //手势改变 在这里设置手势改变过程中要进行的百分比改变
        case UIGestureRecognizerStateChanged:
        {
            [self updateInteractiveTransition:value];//更新百分比
        }
            break;
            //手势结束  在这里设置手势结束后的操作  本文在这里进行判断手势是否过半 过半则完成转场否则取消
        case UIGestureRecognizerStateEnded:
        {
            self.isStart = NO;
            if (value > 0.5) {
                [self finishInteractiveTransition];//报告交互取消，返回切换前的状态
            }else {
                [self cancelInteractiveTransition];//报告交互完成，更新到切换后的状态
            }
        }
            break;
        default:
            break;
    }
}

/**
 *  随着手势的开始开始一些转场的操作
 */
- (void)startGesture {
    switch (self.type) {
        case WPYTransitionTypePresent:
        {
            if (_present) {
                _present();
            }
        }
            break;
        case WPYTransitionTypeDismiss:
        {
            [self.vc dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case WPYTransitionTypePush:
        {
            if (_push) {
                _push();
            }
        }
            break;
        case WPYTransitionGestureDirectionDown:
        {
            [self.vc.navigationController popViewControllerAnimated:YES];
        }
            break;
        default:
            break;
    }
}

@end
