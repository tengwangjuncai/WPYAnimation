//
//  LoginBtnAnimationVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/2.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "LoginBtnAnimationVC.h"
#import "WPYLoginButton.h"
@interface LoginBtnAnimationVC ()

@property (nonatomic, strong)UISwitch *successSwith;
@end

@implementation LoginBtnAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUp];
}

- (void)setUp{
    UIImageView * BgImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    BgImageView.image = [UIImage imageNamed:@"login"];
    [self.view addSubview:BgImageView];
    WPYLoginButton * loginBtn = [[WPYLoginButton alloc] initWithFrame:CGRectMake(30, self.view.center.y + 30, self.view.frame.size.width - 60, 44)];
    [self.view addSubview:loginBtn];
    [loginBtn setBackgroundColor:[UIColor orangeColor]];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    self.successSwith = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 40,40)];
    self.successSwith.center = CGPointMake(self.view.center.x, CGRectGetMaxY(loginBtn.frame) + 30);
    self.successSwith.on = YES;
    [self.view addSubview:self.successSwith];
    
}
- (void)login:(WPYLoginButton *)btn {
    
    typeof(self) __weak weak = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weak.successSwith.on) {
            
            [btn LoginSucceedCompletion:^{
                [self goNewView];
            }];
        }else {
            
            [btn LoginFailedCompletion:^{
                
            }];
        }
    });
}

- (void)goNewView {
    
    
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
