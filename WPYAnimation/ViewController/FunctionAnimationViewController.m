//
//  FunctionAnimationViewController.m
//  WPYAnimation
//
//  Created by wpy on 16/8/1.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "FunctionAnimationViewController.h"
#import "LoginBtnAnimationVC.h"
#import "LoginIconAnimationVC.h"
#import "LoginViewAnimationVC.h"
@interface FunctionAnimationViewController ()

@end

@implementation FunctionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [WPYButton createBtn:@[@"登录按钮Animation",@"登录App图标Animation",@"打印机吐纸登录Animation"] Action:@selector(btnClicked:) SuperVC:self];
}
-(void)btnClicked:(UIButton *)btn {
    switch (btn.tag) {
        case 100:
        {
            LoginBtnAnimationVC *vc = [[LoginBtnAnimationVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 101:
        {
            LoginIconAnimationVC *vc = [[LoginIconAnimationVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 102:
        {
            LoginViewAnimationVC *vc = [[LoginViewAnimationVC alloc] init];
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
