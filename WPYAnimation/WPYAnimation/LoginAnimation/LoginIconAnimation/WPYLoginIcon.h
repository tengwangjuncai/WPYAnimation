//
//  WPYLoginIcon.h
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYLoginIcon : UIImageView<CAAnimationDelegate>

typedef void (^LoginAnimation)();

@property (nonatomic,copy)LoginAnimation handle;
@property (nonatomic, strong)UIView *maskView;

- (void)beginLoginAnimation;

- (void)LoginSucceedCompletion:(LoginAnimation)completion;

- (void)LoginFailedCompletion:(LoginAnimation)completion;
@end
