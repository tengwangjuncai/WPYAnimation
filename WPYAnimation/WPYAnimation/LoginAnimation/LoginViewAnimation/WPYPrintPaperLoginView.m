//
//  WPYPrintPaperLoginView.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/14.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYPrintPaperLoginView.h"

@interface WPYPrintPaperLoginView()<CAAnimationDelegate>



@property (nonatomic, strong)UIView * loginBackView;

@property (nonatomic, strong)UIView * registerBackView;

@property (nonatomic, strong)UITextField * userNameTextFiled;

@property (nonatomic, strong)UITextField * passWordTextFiled;

@property (nonatomic, strong)UIButton * loginBtn;

@property (nonatomic, strong)UIButton * registerBtn;

@property (nonatomic, strong)UIButton * submitBtn;

@property (nonatomic, strong)UITextField * rgUserNameTextFiled;

@property (nonatomic, strong)UITextField * rgPassWordTextFiled;

@property (nonatomic, strong)UITextField * rgPWCertainTextFiled;

@property (nonatomic, strong)UITextField * rgPhoneNumTextFiled;

@end
@implementation WPYPrintPaperLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLoginView];
    }
    return self;
}


- (void)createLoginView {
    
    self.printerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, self.frame.size.width - 100, 40)];
    self.printerImageView.image = [UIImage imageNamed:@"printPaper"];
    [self addSubview:self.printerImageView];
    
    self.loginBackView = [[UIView alloc] initWithFrame:CGRectMake(60, 120, self.frame.size.width - 120, 0)];
    self.loginBackView.layer.cornerRadius = 5;
    self.loginBackView.backgroundColor = [UIColor whiteColor];
    self.loginBackView.clipsToBounds = YES;
    self.loginBackView.layer.borderWidth = 1;
    self.loginBackView.layer.borderColor = [UIColor blackColor].CGColor;
    [self addSubview:self.loginBackView];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.frame = CGRectMake(10, 140, self.frame.size.width-140, 35);
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
    self.registerBtn.frame = CGRectMake(10, 185, self.frame.size.width-140, 35);
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
    
   // [self loginViewAppearAnimation];
}

- (void)createRegisterView {
    self.registerBackView = [[UIView alloc] initWithFrame:CGRectMake(60, 120, self.frame.size.width - 120, 0)];
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
    self.rgPhoneNumTextFiled.placeholder = @"请输入电话号码";
    [self.registerBackView  addSubview:self.rgPhoneNumTextFiled];
    self.rgPhoneNumTextFiled.hidden = YES;
    
    self.submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submitBtn.frame = CGRectMake(10, 230, self.frame.size.width-140, 35);
    [self.submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    self.submitBtn.backgroundColor = [UIColor redColor];
    self.submitBtn.layer.cornerRadius = 5;
    self.submitBtn.layer.borderWidth = 1;
    self.submitBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.submitBtn addTarget:self action:@selector(submitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.submitBtn.clipsToBounds = YES;
    [self.registerBackView addSubview:self.submitBtn];
    self.submitBtn.hidden = YES;
}

- (void)loginViewAppearAnimation {
    [UIView animateWithDuration:1 delay:1.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.loginBackView.frame = CGRectMake(60, 120, self.frame.size.width - 120, 250);
    } completion:^(BOOL finished) {
        self.userNameTextFiled.hidden = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.passWordTextFiled.hidden = NO;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.loginBtn.hidden = NO;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.registerBtn.hidden = NO;
                });
            });
        });
    }];
}

- (void)registerViewAppearAnimation {
    
    [UIView animateWithDuration:1 delay:1.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.registerBackView.frame = CGRectMake(60, 115, self.frame.size.width - 120, 280);
    } completion:^(BOOL finished) {
        self.rgUserNameTextFiled.hidden = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.rgPassWordTextFiled.hidden = NO;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.rgPWCertainTextFiled.hidden = NO;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.rgPhoneNumTextFiled.hidden = NO;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        self.submitBtn.hidden = NO;
                    });
                });
            });
        });
    }];

}
- (void)loginViewDisappearAnimation {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.loginBackView.frame = CGRectMake(60, 115, self.frame.size.width - 120, 0);
    } completion:^(BOOL finished) {
        self.userNameTextFiled.hidden = YES;
        self.passWordTextFiled.hidden = YES;
        self.loginBtn.hidden = YES;
        self.registerBtn.hidden = YES;
    }];
}
- (void)registerViewDisappearAnimation {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.registerBackView.frame = CGRectMake(60, 115, self.frame.size.width - 120, 0);
    } completion:^(BOOL finished) {
        self.rgUserNameTextFiled.hidden = YES;
        self.rgPassWordTextFiled.hidden = YES;
        self.rgPWCertainTextFiled.hidden = YES;
        self.rgPhoneNumTextFiled.hidden = YES;
        self.submitBtn.hidden = YES;
    }];

}

- (void)loginFailedAnimation{
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPoint point = self.printerImageView.layer.position;
    
    keyFrameAnimation.values = @[[NSValue valueWithCGPoint:CGPointMake(point.x, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x - 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x + 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x - 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x + 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x - 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x + 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x - 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x + 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x - 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x + 10, point.y)],[NSValue valueWithCGPoint:CGPointMake(point.x, point.y)]];
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    keyFrameAnimation.duration = 0.5f;
    keyFrameAnimation.delegate = self;
    self.printerImageView.layer.position = point;
    [self.printerImageView.layer addAnimation:keyFrameAnimation forKey:keyFrameAnimation.keyPath];
}
- (void)loginBtnClicked:(UIButton *)btn {
    [self loginViewDisappearAnimation];
    if (self.userNameTextFiled.text.length > 5 && self.userNameTextFiled.text.length < 13 && self.passWordTextFiled.text.length > 5 ) {
        
      BOOL lg =  [self.delegate loginWithUserName:self.userNameTextFiled.text PassWord:self.passWordTextFiled.text];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (lg) {
            [self.delegate loginSuccessToTransition];
           // [self loginViewAppearAnimation];
        }else {
            
                [self loginFailedAnimation];
            
        }
             });
    }else if(self.userNameTextFiled.text.length < 5 || self.userNameTextFiled.text.length > 13){
        
    }else if(self.passWordTextFiled.text.length < 5){
        
    }
}

- (void)registerBtnClicked:(UIButton *)btn {
    if (! self.registerBackView) {
        [self createRegisterView];
    }
    [self loginViewDisappearAnimation];
   
    [self registerViewAppearAnimation];
    
}

- (void)submitBtnClicked:(UIButton *)btn {
    if ([self.delegate registerSucceedWithUserName:self.rgUserNameTextFiled.text PassWord:self.rgPassWordTextFiled.text CertainPw:self.rgPWCertainTextFiled.text PhioneNum:self.rgPhoneNumTextFiled.text]) {
        [self registerViewDisappearAnimation];
        self.userNameTextFiled.text = self.rgUserNameTextFiled.text;
        self.passWordTextFiled.text = self.rgPassWordTextFiled.text;
        [self loginViewAppearAnimation];
    }
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CABasicAnimation * animation = (CABasicAnimation *)anim;
    if ([animation.keyPath isEqualToString:@"position"]) {
        [self.printerImageView.layer removeAllAnimations];
        [self loginViewAppearAnimation];
    }
}
@end
