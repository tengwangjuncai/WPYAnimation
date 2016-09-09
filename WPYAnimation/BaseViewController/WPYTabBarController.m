//
//  WPYTabBarController.m
//  ZZ15191060WangPengYu
//
//  Created by Qianfeng on 16/1/16.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "WPYTabBarController.h"
#import "WPYNavigationController.h"

@interface WPYTabBarController ()

@end

@implementation WPYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = [self createViewControllers];
}
- (NSArray *)createViewControllers {
    NSMutableArray *resultArray = [NSMutableArray array];
    NSArray *titles = @[@"图片动画",@"页面动画",@"核心动画",@"转场动画",@"功能动画"];
    NSArray *imageNames = @[@"tabbar_mainframe",@"tabbar_contacts",@"tabbar_discover",@"tabbar_me",@"tabbar_discover"];
    NSArray *classNames = @[@"ImagesAnimationViewController",@"UIViewAnimationViewController",@"CoreAnimationViewController",@"ChangeViewAnimationViewController",@"FunctionAnimationViewController"];
    for (int i=0; i<5; i++) {

        NSString * imageName = imageNames[i];
        NSString * selectedImageName = [imageName stringByAppendingFormat:@"HL"];
        UIImage * image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage * imageHL = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        Class cls = NSClassFromString(classNames[i]);
        UIViewController *vc = [[cls alloc]init];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titles[i] image:image selectedImage:imageHL];
        vc.tabBarItem = item;
        vc.title = titles[i];
        vc.view.backgroundColor = [UIColor colorWithRed:ColorValue green:ColorValue blue:ColorValue alpha:1];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName,[UIColor grayColor],NSForegroundColorAttributeName,nil];
        [item setTitleTextAttributes:dic forState:UIControlStateSelected];
        [item setTitleTextAttributes:dic forState:UIControlStateNormal];
        WPYNavigationController *nav = [[WPYNavigationController alloc] initWithRootViewController:vc];
//        UIImage *image = [UIImage imageNamed:@"toolBar"];
//        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
//        [nav.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [resultArray addObject:nav];
    }
    
    return resultArray;
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
