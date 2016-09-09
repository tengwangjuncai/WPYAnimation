//
//  LoginIconAnimationVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/2.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "LoginIconAnimationVC.h"
#import "WPYLoginIcon.h"
@interface LoginIconAnimationVC ()

@end

@implementation LoginIconAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUp];
    
}

- (void)setUp {
    
    WPYLoginIcon *icon = [[WPYLoginIcon alloc] initWithFrame:CGRectMake(self.view.center.x - 50, 100, 100, 100)];
    icon.image = [UIImage imageNamed:@"icon"];
    
    [self.view addSubview:icon];
    [icon beginLoginAnimation];
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
