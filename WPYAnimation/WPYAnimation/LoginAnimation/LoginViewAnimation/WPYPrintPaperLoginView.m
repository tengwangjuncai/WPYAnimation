//
//  WPYPrintPaperLoginView.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/14.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYPrintPaperLoginView.h"

@implementation WPYPrintPaperLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)createLoginView {
    
    self.printerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, self.frame.size.width - 100, 30)];
    self.printerImageView.image = [UIImage imageNamed:@"printPaper"];
    [self addSubview:self.printerImageView];
    
    self.loginBackView = [[UIView alloc] initWithFrame:CGRectMake(60, 115, self.frame.size.width - 120, 0)];
    self.loginBackView.layer.cornerRadius = 5;
    self.loginBackView.backgroundColor = [UIColor whiteColor];
    self.loginBackView.clipsToBounds = YES;
    self.loginBackView.layer.borderWidth = 1;
    self.loginBackView.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:self.loginBackView];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.frame = CGRectMake(10, 120, self.frame.size.width-140, 35);
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor lightGrayColor];
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.borderWidth = 1;
    self.loginBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.loginBtn addTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.loginBtn.clipsToBounds = YES;
    [self.loginBackView addSubview:self.loginBtn];
    self.loginBtn.hidden = YES;
    
    self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerBtn.frame = CGRectMake(10, 165, self.frame.size.width-140, 35);
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.registerBtn.backgroundColor = [UIColor redColor];
    [self.registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.layer.borderWidth = 1;
    self.registerBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.registerBtn.clipsToBounds = YES;
    [self.loginBackView addSubview:self.registerBtn];
    self.registerBtn.hidden = YES;
    
    self.userNameTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 20, self.frame.size.width-140, 40)];
    self.userNameTextFiled.placeholder = @"帐号";
    self.userNameTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.loginBackView addSubview:self.userNameTextFiled];
    self.userNameTextFiled.hidden = YES;
    
    self.passWordTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 70, self.frame.size.width-140, 40)];
    self.passWordTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    self.passWordTextFiled.placeholder = @"密码";
    [self.loginBackView  addSubview:self.passWordTextFiled];
    self.passWordTextFiled.hidden = YES;
}

- (void)createRegisterView {
    self.registerBackView = [[UIView alloc] initWithFrame:CGRectMake(60, 115, self.frame.size.width - 120, 0)];
    self.registerBackView.layer.cornerRadius = 5;
    self.registerBackView.backgroundColor = [UIColor whiteColor];
    self.registerBackView.clipsToBounds = YES;
    self.registerBackView.layer.borderWidth = 1;
    self.registerBackView.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:self.registerBackView];
    
    self.rgUserNameTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 20, self.frame.size.width-140, 40)];
    self.rgUserNameTextFiled.placeholder = @"帐号 要求6-12位字母或数字";
    self.rgUserNameTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.registerBackView addSubview:self.rgUserNameTextFiled];
    self.rgUserNameTextFiled.hidden = YES;
    
    self.rgPassWordTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 70, self.frame.size.width-140, 40)];
    self.rgPassWordTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    self.rgPassWordTextFiled.placeholder = @"密码 包含数字 字母 不得小于6位";
    [self.registerBackView  addSubview:self.rgPassWordTextFiled];
    self.rgPassWordTextFiled.hidden = YES;
    
    self.rgPWCertainTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 120, self.frame.size.width-140, 40)];
    self.rgPWCertainTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    self.rgPWCertainTextFiled.placeholder = @"再次确认密码";
    [self.registerBackView  addSubview:self.rgPWCertainTextFiled];
    self.rgPWCertainTextFiled.hidden = YES;
    
    self.rgPhoneNumTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 170, self.frame.size.width-140, 40)];
    self.rgPhoneNumTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    self.rgPhoneNumTextFiled.placeholder = @"再次确认密码";
    [self.rgPhoneNumTextFiled  addSubview:self.rgPWCertainTextFiled];
    self.rgPhoneNumTextFiled.hidden = YES;
    
    self.submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submitBtn.frame = CGRectMake(10, 230, self.frame.size.width-140, 35);
    [self.submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    self.submitBtn.backgroundColor = [UIColor lightGrayColor];
    self.submitBtn.layer.cornerRadius = 5;
    self.submitBtn.layer.borderWidth = 1;
    self.submitBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.submitBtn addTarget:self action:@selector(submitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.submitBtn.clipsToBounds = YES;
    [self.registerBackView addSubview:self.submitBtn];
    self.submitBtn.hidden = YES;
}

- (void)loginBtnClicked:(UIButton *)btn {
    
}

- (void)registerBtnClicked:(UIButton *)btn {
    
}

- (void)submitBtnClicked:(UIButton *)btn {
    
}
@end
