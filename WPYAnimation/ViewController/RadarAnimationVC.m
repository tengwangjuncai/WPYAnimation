//
//  RadarAnimationVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/20.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "RadarAnimationVC.h"
#import "WPYRadarViewAmimation.h"
@interface RadarAnimationVC ()
@property (nonatomic, strong)WPYRadarViewAmimation * radarView;
@end

@implementation RadarAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createRadarView];
}
- (void)createRadarView {
    self.radarView = [[WPYRadarViewAmimation alloc] initWithFrame:CGRectMake(0, 0, 370, 370)];
    self.radarView.center = self.view.center;
    [self.view addSubview:self.radarView];
    [self.radarView radarScan];
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
