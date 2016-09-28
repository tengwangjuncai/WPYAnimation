//
//  ChangeViewAnimationViewController.m
//  WPYAnimation
//
//  Created by wpy on 16/8/1.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "ChangeViewAnimationViewController.h"
#import "BackgroundVCViewController.h"
#import "WPYTransitionAnimation.h"
#import "CircleSpreadVC.h"
#import "MagicalMoveVC.h"
#import "PopViewVC.h"
#import "PageCoverVC.h"
#import "LoginViewAnimationVC.h"
@interface ChangeViewAnimationViewController ()

@end

@implementation ChangeViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [WPYButton createBtn:@[@"系统自带转场动画",@"翻页转场",@"收缩转场",@"神奇转场",@"弹性转场页面共存",@"打印机吐纸转场"] Action:@selector(btnClicked:) SuperVC:self];
    NSLog(@"ssss%p",self);
}

-(void)btnClicked:(UIButton *)btn {
    switch (btn.tag) {
        case 100:
        {
            //创建转场动画
            WPYTransitionAnimation * animation = [WPYTransitionAnimation createTransitionAnimationWithFunctionName:kCAMediaTimingFunctionEaseOut Type:@"rippleEffect" SubType:kCATransitionReveal Duration:2];
            //放到 navigationController.view.layer
            [self.navigationController.view.layer addAnimation:animation forKey:nil];

            
            BackgroundVCViewController *vc = [BackgroundVCViewController new];
            vc.type = bubbleBackgroundView;
           
            
        NSString *str = @"系统转场类型如下：                                    1 cube－ 立方体效果   2 suckEffect－收缩效果，如一块布被抽走   3 oglFlip－上下翻转效果   4 rippleEffect －滴水效果   5 pageCurl －向上翻一页   6 pageUnCurl －向下翻一页   7 rotate 旋转效果   8 cameraIrisHollowOpen     相机镜头打开效果(不支持过渡方向) 9 cameraIrisHollowClose    相机镜头关上效果(不支持过渡方向)  动画类型   10 kCATransitionFade    新视图逐渐显示在屏幕上，旧视图逐渐淡化出视野11 kCATransitionMoveIn  新视图移动到旧视图上面，好像盖在上面   12 kCATransitionPush    新视图将旧视图退出去   13 kCATransitionReveal  将旧视图移开显示下面的新视图                                    具体可点入WPYTransitionAnimation 查看";
             vc.str = str;
             [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 101:
        {
            PageCoverVC *vc = [[PageCoverVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 102:
        {
            CircleSpreadVC *vc = [CircleSpreadVC new];
            [self.navigationController pushViewController:vc animated:YES];
            NSLog(@"ssss%p",vc);
        }
            break;
        case 103:
        {    MagicalMoveVC *vc = [[MagicalMoveVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 104:
        {
            PopViewVC *vc = [[PopViewVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 105:
        {
            LoginViewAnimationVC * vc = [[LoginViewAnimationVC alloc] init];
            vc.isTransition = YES;
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
