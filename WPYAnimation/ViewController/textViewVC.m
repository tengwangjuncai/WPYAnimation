//
//  textViewVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/13.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "textViewVC.h"

@implementation textViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * bgImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:bgImageView];
    bgImageView.image = [UIImage imageNamed:@"loginSucceed"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
