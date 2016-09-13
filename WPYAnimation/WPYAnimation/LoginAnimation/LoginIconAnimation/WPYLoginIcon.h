//
//  WPYLoginIcon.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/2.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYLoginIcon : UIImageView<UIApplicationDelegate>

typedef void (^LoginAnimation)();

@property (nonatomic,copy)LoginAnimation handle;
@property (nonatomic, strong)UIView *maskView;

- (void)beginLoginAnimation;

- (void)LoginSucceedCompletion:(LoginAnimation)completion;

- (void)LoginFailedCompletion:(LoginAnimation)completion;
@end
