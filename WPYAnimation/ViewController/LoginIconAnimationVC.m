//
//  LoginIconAnimationVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/2.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "LoginIconAnimationVC.h"
#import "WPYLoginIcon.h"
#import "textViewVC.h"
#import "WPYTransitionAnimation.h"
@interface LoginIconAnimationVC ()
@property (nonatomic, strong)WPYLoginIcon * icon;
@property (nonatomic, strong)UILabel * tipLabel;
@property (nonatomic, strong)UISwitch * netSwith;

@end

#define NORMAL_FONT_SIZE(v) ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? [UIFont fontWithName:@"PingFangSC-Regular" size:v] : [UIFont systemFontOfSize:v]
@implementation LoginIconAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUserTextField];
    [self createPassWordTextField];
    [self createEnterButton];
    [self createRegisterButton];
    [self creatNetSwith];
    [self createTipLabel];
    [self setUp];
    
}

- (void)setUp {
    
    self.icon = [[WPYLoginIcon alloc] initWithFrame:CGRectMake(self.view.center.x - 50,100, 100, 100)];
    self.icon.image = [UIImage imageNamed:@"icon"];
    self.icon.layer.cornerRadius = 15;
    self.icon.clipsToBounds = YES;
    [self.view addSubview:self.icon];
 
}


- (void)returnDataBack:(NSArray *)dataArr {
    UITextField *tfUser = (UITextField *)[self.view viewWithTag:10];
    UITextField *tfPassWord = (UITextField *) [self.view viewWithTag:12];
    tfUser.text = dataArr[0];
    tfPassWord.text = dataArr[1];
}
- (UILabel *)createLabel {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    return label;
}
- (UIButton *)createButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.layer.borderWidth = 1.0;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    return btn;
}
- (void)createUserTextField {
    UILabel *label = [self createLabel];
    label.frame = CGRectMake(50, 250, 80, 30);
    label.text = @"用户名:";
    label.tag = 9;
    UITextField * tf=[[UITextField alloc] initWithFrame:CGRectMake(130, 250, 200, 35)];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.layer.borderColor = [UIColor blackColor].CGColor;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    tf.font = [UIFont systemFontOfSize:18];
    tf.placeholder = @"请输入用户名";
    tf.tag =10;
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:tf];
}
- (void)createPassWordTextField {
    UILabel *label = [self createLabel];
    label.frame = CGRectMake(50, 350, 80, 30);
    label.text = @"密 码:";
    label.tag = 11;
    UITextField * tf=[[UITextField alloc] initWithFrame:CGRectMake(130, 350, 200, 35)];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    tf.font = [UIFont systemFontOfSize:18];
    tf.placeholder = @"请输入密码";
    tf.secureTextEntry = YES;
    tf.tag = 12;
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:tf];
}
- (void)createEnterButton {
    UIButton *btn = [self createButton];
    btn.frame =CGRectMake(50, 500, 120, 40);
    btn.titleLabel.textColor = [UIColor blueColor];
    [btn setTitle:@"登 陆" forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    //设置圆角
    btn.layer.cornerRadius = 10;
    [btn addTarget:self action:@selector(enterDD:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 13;
    [self.view addSubview:btn];
}
- (void)createRegisterButton {
    UIButton *btn = [self createButton];
    btn.frame = CGRectMake(230, 500, 120, 40);
    btn.titleLabel.textColor = [UIColor blueColor];
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    //设置圆角
    btn.layer.cornerRadius = 10;
    btn.tag = 14;
    [self.view addSubview:btn];
}
- (void)createTipLabel {
    self.tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x - 50, self.view.frame.size.height / 2, 100, 21)];
    self.tipLabel.font = NORMAL_FONT_SIZE(16);
    self.tipLabel.textColor = [UIColor lightGrayColor];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.tipLabel];
    self.tipLabel.hidden = YES;
}
- (void)creatNetSwith {
    self.netSwith = [[UISwitch alloc] initWithFrame:CGRectMake(60, 400, 100, 30)];
    self.netSwith.onTintColor = [UIColor orangeColor];
    [self.view addSubview:self.netSwith];
    self.netSwith.on = YES;
}
- (void)ViewHide {
        for (int i=9; i<15; i++) {
            UIView *view = [self.view viewWithTag:i];
            view.hidden = YES;
        }
    self.netSwith.hidden = YES;
    
}

- (void)ViewShow {
    for (int i=9; i<15; i++) {
        UIView *view = [self.view viewWithTag:i];
        view.hidden = NO;
    }
    self.tipLabel.alpha = 1;
    self.tipLabel.hidden = YES;
    self.netSwith.hidden = NO;
}
- (void)enterDD:(UIButton *)btn {
    [self ViewHide];
    [self.icon beginLoginAnimation];
    self.tipLabel.hidden = NO;
    self.tipLabel.text = @"正在登录中……";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (self.netSwith.on) {
            self.tipLabel.text = @"登录成功";
            [UIView animateWithDuration:0.5 animations:^{
                self.tipLabel.alpha = 0;
            }];
            [self.icon LoginSucceedCompletion:^{
                self.tipLabel.hidden = YES;
                [self goView];
                [self ViewShow];
            }];
        }else {
            self.tipLabel.text = @"登录失败";
            [UIView animateWithDuration:0.5 animations:^{
                self.tipLabel.alpha = 0;
            }];
            [self.icon LoginFailedCompletion:^{
    
                [self ViewShow];
            }];
        }
    });
}

- (void)goView {
    
    textViewVC * vc = [[textViewVC alloc] init];
    CATransition *anima = [CATransition animation];
    [anima setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    anima.duration = 2;
    anima.type = kCATransitionFade;//@"cameraIrisHollowOpen";//rotate
   
    [self.navigationController.view.layer addAnimation:anima forKey:@"TransitionFade" ];
    [self.navigationController pushViewController:vc animated:NO];
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
