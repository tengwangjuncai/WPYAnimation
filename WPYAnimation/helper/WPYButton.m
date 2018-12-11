//
//  WPYButton.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYButton.h"

@implementation WPYButton
+ (void)createBtn:(NSArray *)btnNameArray  Action:(SEL)action SuperVC:(UIViewController *)vc{
    for (int i = 0; i < btnNameArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(vc.view.center.x - 100, 100 + i * 60, 200, 44);
        btn.backgroundColor = [UIColor orangeColor];
        btn.tag = i + 100;
        [btn setTitle:btnNameArray[i] forState:UIControlStateNormal];
        [btn addTarget:vc action:action forControlEvents:UIControlEventTouchUpInside];
        [vc.view addSubview:btn];
    }
}

@end
