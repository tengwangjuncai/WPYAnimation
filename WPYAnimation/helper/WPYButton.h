//
//  WPYButton.h
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYButton : UIButton
+ (void)createBtn:(NSArray *)btnNameArray  Action:(SEL)action SuperVC:(UIViewController *)vc;
@end
