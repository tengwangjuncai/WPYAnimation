//
//  textViewVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/13.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "textViewVC.h"

@implementation textViewVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * bgImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:bgImageView];
    bgImageView.image = [UIImage imageNamed:@"loginSucceed"];
    
    if (self.btnShow) {
        [self createBtn];
    }
    }
- (void)createBtn {
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 200, 50);
    btn.center = self.view.center;
    [btn setTitle:@"点我返回😯哦" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)btnClicked:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [WPYTransition WPYCtransitionWithTransitionType:WPYPrintPaperTransitionPresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [WPYTransition WPYCtransitionWithTransitionType:WPYPrintPaperTransitionDismiss];
}
@end
