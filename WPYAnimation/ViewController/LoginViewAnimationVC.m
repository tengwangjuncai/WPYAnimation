//
//  LoginViewAnimationVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/18.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "LoginViewAnimationVC.h"
#import "WPYTransition.h"
#import "textViewVC.h"
@interface LoginViewAnimationVC ()<WPYPrintPaperLoginViewDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic, strong)UISwitch *netSwitch;

@end

@implementation LoginViewAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLoginView];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [self.loginView loginViewAppearAnimation];
}
- (void)createLoginView {
    self.loginView = [[WPYPrintPaperLoginView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 60)];
    self.loginView.delegate = self;
    [self.view addSubview:self.loginView];
    
    self.netSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(self.view.center.x - 15, self.view.frame.size.height - 50, 40, 40)];
    self.netSwitch.onTintColor = [UIColor orangeColor];
    [self.view addSubview:self.netSwitch];
}

- (BOOL)loginWithUserName:(NSString *)userName PassWord:(NSString *)pw {
    return self.netSwitch.on;
}

- (BOOL)registerSucceedWithUserName:(NSString *)userName PassWord:(NSString *)pw CertainPw:(NSString *)cpw PhioneNum:(NSString *)numStr {
    return self.netSwitch.on;
}

- (void)loginSuccessToTransition {
    textViewVC * vc = [[textViewVC alloc] init];
    vc.btnShow = YES;
    [self presentViewController:vc animated:YES completion:nil];
    
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
