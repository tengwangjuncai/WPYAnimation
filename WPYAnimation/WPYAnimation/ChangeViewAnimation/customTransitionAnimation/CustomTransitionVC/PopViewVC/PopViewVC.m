//
//  PopViewVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/16.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "PopViewVC.h"
#import "Masonry.h"
#import "WPYTransitionGesture.h"
#import "WPYTransition.h"
#import "PopViewPresentVC.h"
@interface PopViewVC ()<PopViewPresentVCDelegate>

@property (nonatomic, strong)WPYTransitionGesture *transitionPresent;
@end

@implementation PopViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
}

- (void)setUpUI {
    self.title = @"弹性转场页面共存";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).offset(60);
        make.size.mas_equalTo(CGSizeMake(250, 250));
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点我或者向上滑动" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(imageView.mas_bottom).offset(30);
    }];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    
    self.transitionPresent = [WPYTransitionGesture WPYTransitionWithTransitionType:WPYTransitionTypePresent GestureDirection:WPYTransitionGestureDirectionUp];
    
    typeof (self) weakSelf = self;
    self.transitionPresent.present = ^(){
        [weakSelf present];
    };
    
    [_transitionPresent addPanGestureForViewController:self.navigationController];
}

- (void)present {
    PopViewPresentVC *vc = [[PopViewPresentVC alloc] init];
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)popViewPresentVCDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent {
    return _transitionPresent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
