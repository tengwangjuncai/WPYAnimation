//
//  Dynamics.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/12/6.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "Dynamics.h"
#import "WPYDynamicsView.h"
@interface Dynamics ()

@end

@implementation Dynamics

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createDynamicsView];
}

- (void)createDynamicsView {
    WPYDynamicsView * view = [[WPYDynamicsView alloc] initWithFrame:CGRectMake(self.view.center.x - 30, 200, 60, 60)];
    view.layer.cornerRadius = 30;
    [self.view addSubview:view];
    [view setUpWithAnchor:CGPointMake(self.view.center.x, 100) inView:self.view];
    
    [view setLineLength:50.f];
    [view setLineColor:[UIColor purpleColor]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    label.text = @"拉-_-我";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
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
