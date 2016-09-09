//
//  PopViewPresentVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/17.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "PopViewPresentVC.h"
#import "WPYTransitionGesture.h"
#import "WPYTransition.h"
#import "Masonry.h"
@interface PopViewPresentVC ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) WPYTransitionGesture *transitionDismiss;
@property (nonatomic, strong) WPYTransitionGesture *transitionPresent;
@end

@implementation PopViewPresentVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //d Do any additional setup after loading the view.
    [self setUpUI];
}

- (void)setUpUI {
    self.view.clipsToBounds= YES;
    self.view.layer.cornerRadius = 10;
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点我或者向下滑动" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(30);
    }];
    
    self.transitionDismiss = [WPYTransitionGesture WPYTransitionWithTransitionType:WPYTransitionTypeDismiss GestureDirection:WPYTransitionGestureDirectionDown];
    [self.transitionDismiss addPanGestureForViewController:self];
}

- (void)dismiss {
    if (_delegate && [_delegate respondsToSelector:@selector(popViewPresentVCDismiss)]) {
        [_delegate popViewPresentVCDismiss];
    }
}

//@protocol UIViewControllerTransitioningDelegate

//这个接口的作用比较简单单一，在需要VC切换的时候系统会像实现了这个接口的对象询问是否需要使用自定义的切换效果。这个接口共有四个类似的方法

//前两个方法是针对动画切换的，我们需要分别在呈现VC和解散VC时，给出一个实现了UIViewControllerAnimatedTransitioning接口的对象（其中包含切换时长和如何切换）。后两个方法涉及交互式切换,一般要与 手势驱动的百分比切换配合

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [WPYTransition WPYCtransitionWithTransitionType:WPYPopTransitionPresent ];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [WPYTransition WPYCtransitionWithTransitionType:WPYPopTransitionDismiss];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return _transitionDismiss.isStart ? _transitionDismiss : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    WPYTransitionGesture * transitionPresent = [self.delegate interactiveTransitionForPresent];
    return transitionPresent.isStart ? transitionPresent : nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
