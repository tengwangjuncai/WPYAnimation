//
//  CoreAnimationViewController.m
//  WPYAnimation
//
//  Created by wpy on 16/8/1.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "CoreAnimationViewController.h"
#import "Cube3DViewController.h"
#import "BarAnimationViewController.h"
#import "RoundWaterLinesViewController.h"
#import "TouchPopViewViewController.h"
#import "RadarAnimationVC.h"
#import "IrregularViewChangeVC.h"
#import "Dynamics.h"
#import "takePhotosBtnAnimationVC.h"
@interface CoreAnimationViewController ()

@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [WPYButton createBtn:@[@"3D立方体动画",@"条形动画",@"水波纹动画",@"点击弹性圆圈动画",@"雷达扫描动画",@"不规则图形变化",@"物理仿真动画",@"拍照按钮动画"] Action:@selector(btnClicked:) SuperVC:self];
}

- (void)btnClicked:(UIButton *)btn {
    switch (btn.tag) {
        case 100:
        {
            Cube3DViewController * vc = [[Cube3DViewController alloc] init];
            vc.view.backgroundColor = [UIColor colorWithRed:ColorValue green:ColorValue blue:ColorValue alpha:1];
            [self.navigationController pushViewController:vc animated:nil];
        }
            break;
        case 101:
        {
            BarAnimationViewController * vc = [[BarAnimationViewController alloc] init];
            vc.view.backgroundColor = [UIColor colorWithRed:ColorValue green:ColorValue blue:ColorValue alpha:1];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 102:
        {
            RoundWaterLinesViewController * vc = [[RoundWaterLinesViewController alloc] init];
            vc.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 103:
        {
            TouchPopViewViewController * vc = [[TouchPopViewViewController alloc] init];
            vc.view.backgroundColor = [UIColor colorWithRed:ColorValue green:ColorValue blue:ColorValue alpha:1];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 104:
        {
            RadarAnimationVC * vc = [[RadarAnimationVC alloc] init];
            vc.view.backgroundColor = [UIColor blackColor];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 105:
        {
            IrregularViewChangeVC * vc = [[IrregularViewChangeVC alloc] init];
            vc.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 106:
        {
            Dynamics * vc = [[Dynamics alloc] init];
            vc.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 107:
        {
            takePhotosBtnAnimationVC * vc = [[takePhotosBtnAnimationVC alloc] init];
            //vc.view.backgroundColor = [UIColor orangeColor];
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
