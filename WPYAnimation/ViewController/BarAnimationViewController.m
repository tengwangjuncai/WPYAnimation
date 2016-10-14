//
//  BarAnimationViewController.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/13.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "BarAnimationViewController.h"
#import "WPYBarAnimationView.h"
@interface BarAnimationViewController ()

@end

@implementation BarAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WPYBarAnimationView * view = [[WPYBarAnimationView alloc] initWithFrame:CGRectMake(0, 0, 300, 120)];
    view.center = self.view.center;
    [self.view addSubview:view];
    [view startAnimation];
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
