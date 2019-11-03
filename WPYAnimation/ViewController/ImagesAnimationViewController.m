//
//  ImagesAnimationViewController.m
//  WPYAnimation
//
//  Created by wpy on 16/8/1.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "ImagesAnimationViewController.h"
#import "WPYButton.h"
#import "ImagesVC.h"
#import "imageVC2.h"
@interface ImagesAnimationViewController ()

@end

@implementation ImagesAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // [self createBtn:@[@"图片动画",@"动态图片动画"]];
    [WPYButton createBtn:@[@"图片动画",@"动态图片动画",@"临时添加"] Action:@selector(btnClicked:) SuperVC:self];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
    btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn];
}
- (void)btnClicked:(UIButton *)btn {
    if (btn.tag == 100) {
        ImagesVC *vc1 = [ImagesVC new];
        [self.navigationController pushViewController:vc1 animated:YES];
    }else if (btn.tag == 101) {
        imageVC2 *vc2 = [imageVC2 new];
        [self.navigationController pushViewController:vc2 animated:YES];
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
