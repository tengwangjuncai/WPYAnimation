//
//  WPYLoginIcon.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/2.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYLoginIcon : UIImageView

typedef void (^LoginAnimation)();

@property (nonatomic,assign)LoginAnimation handle;

- (void)beginLoginAnimation;

- (void)LoginSucceedCompletion:(LoginAnimation)completion;

- (void)LoginFailedCompletion:(LoginAnimation)completion;
@end
