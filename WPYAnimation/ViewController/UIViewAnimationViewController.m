//
//  UIViewAnimationViewController.m
//  WPYAnimation
//
//  Created by wpy on 16/8/1.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "UIViewAnimationViewController.h"
#import "BackgroundVCViewController.h"
@interface UIViewAnimationViewController ()

@end

@implementation UIViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [WPYButton createBtn:@[@"下雪类型的背景",@"泡沫类型的背景",@"弹簧类型的按钮"] Action:@selector(btnClicked:) SuperVC:self];
}

- (void)btnClicked:(UIButton *)btn {
    switch (btn.tag) {
        case 100:
        {
            BackgroundVCViewController *vc = [BackgroundVCViewController new];
            vc.type = snowBackgroundView;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 101:
        {
            BackgroundVCViewController *vc = [BackgroundVCViewController new];
            vc.type = bubbleBackgroundView;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 102:
        {
            BackgroundVCViewController *vc = [BackgroundVCViewController new];
            vc.type = 3;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
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
