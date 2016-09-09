//
//  CircelSpreadPresentVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/9.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "CircelSpreadPresentVC.h"
#import "WPYTransitionGesture.h"
#import "WPYTransition.h"
@interface CircelSpreadPresentVC ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong)WPYTransitionGesture * transitionGesture;
@end

@implementation CircelSpreadPresentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"bg1"];
    [self.view addSubview:imageView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"点我或下拉  返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, self.view.frame.size.width, 44);
    [self.view addSubview:btn];
    
    self.transitionGesture = [WPYTransitionGesture WPYTransitionWithTransitionType:WPYTransitionTypeDismiss GestureDirection:WPYTransitionGestureDirectionDown];
    [self.transitionGesture addPanGestureForViewController:self];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [WPYTransition WPYCtransitionWithTransitionType:WPYCircleSpreadTransitionPresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [WPYTransition WPYCtransitionWithTransitionType:WPYCircleSpreadTransitionDismiss];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionGesture.isStart ? self.transitionGesture : nil;
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
