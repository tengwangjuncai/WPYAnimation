//
//  PageCoverPushVC.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "PageCoverPushVC.h"
#import "WPYTransitionGesture.h"
#import "WPYTransition.h"
#import "Masonry.h"
@interface PageCoverPushVC ()

@property (nonatomic, strong) WPYTransitionGesture *interactiveTransitionPop;
@property (nonatomic, assign) UINavigationControllerOperation navOperation;
@end

@implementation PageCoverPushVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUp];
}

- (void)setUp {
    self.title = @"翻页效果";
    self.view.backgroundColor = [UIColor grayColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    [self.view addSubview:imageView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点我或向右滑动" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(74);
    }];
    
    //初始化 手势过度代理
    _interactiveTransitionPop = [WPYTransitionGesture WPYTransitionWithTransitionType:WPYTransitionTypePop GestureDirection:WPYTransitionGestureDirectionRight];
    //给当前控制器的视图添加手势
    [_interactiveTransitionPop addPanGestureForViewController:self];
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    _navOperation = operation;
    //在pop和push两种情况分别返回动画过渡代理相应的动画操作
    return [WPYTransition WPYCtransitionWithTransitionType:operation == UINavigationControllerOperationPush ? WPYPageCoverTransitionPush:WPYPageCoverTransitionPop];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (_navOperation == UINavigationControllerOperationPush) {
        WPYTransitionGesture *transitionPush = [_delegate interactiveTransitionForPush];
        return transitionPush.isStart ? transitionPush : nil;
    }else {
        
        return _interactiveTransitionPop.isStart ? _interactiveTransitionPop : nil;
    }
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
