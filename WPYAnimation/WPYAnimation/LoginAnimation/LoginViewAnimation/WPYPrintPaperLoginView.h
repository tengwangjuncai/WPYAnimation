//
//  WPYPrintPaperLoginView.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/14.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYPrintPaperLoginView : UIView

@property (nonatomic, strong)UIImageView * printerImageView;

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
