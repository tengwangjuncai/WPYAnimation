//
//  ImagesVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/5.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "ImagesVC.h"

@implementation ImagesVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackgroundColor;
    [self createSlid];
    [self createView];
}
- (void)createSlid {
    
    UISlider *sl = [[UISlider alloc] init];
    sl.frame = CGRectMake(100, 100, 200, 50);
    [self.view addSubview:sl];
    //设置初始值
    sl.minimumValue = 0.1;
    sl.maximumValue = 1;
    sl.value = 1;
    
    [sl addTarget:self action:@selector(chageValue:) forControlEvents:UIControlEventValueChanged];
    sl.continuous = NO;
}
- (void)chageValue:(UISlider *)sl {
    self.imagesAnimation.duration = sl.value;
}
- (void)createView {
    self.imagesAnimation =[ImagesAnimation imagesAnimationViewWithImageNameArray:@[@"1",@"2",@"3",@"4"] frame:CGRectMake(0, 0, 300, 150) animationDuration:1];
    
        self.imagesAnimation.center = self.view.center;
        self.imagesAnimation.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.imagesAnimation];
   }
@end
