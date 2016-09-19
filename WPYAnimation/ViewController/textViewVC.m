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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [WPYTransition WPYCtransitionWithTransitionType:WPYPrintPaperTransitionPresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [WPYTransition WPYCtransitionWithTransitionType:WPYPrintPaperTransitionPop];
}
@end
