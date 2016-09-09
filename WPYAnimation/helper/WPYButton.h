//
//  WPYButton.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/5.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYButton : UIButton
+ (void)createBtn:(NSArray *)btnNameArray  Action:(SEL)action SuperVC:(UIViewController *)vc;
@end
