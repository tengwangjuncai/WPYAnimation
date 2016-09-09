//
//  WPYLoginButton.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/30.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LoginAnimation)();
@interface WPYLoginButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame;

- (void)LoginSucceedCompletion:(LoginAnimation)completion;

- (void)LoginFailedCompletion:(LoginAnimation)completion;
@end
