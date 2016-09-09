//
//  PageCoverVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/19.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "PageCoverVC.h"
#import "PageCoverPushVC.h"
#import "WPYTransitionGesture.h"
#import "Masonry.h"
@interface PageCoverVC ()<PageCoverPushVCDelegate>
@property (nonatomic, strong) WPYTransitionGesture *transitionPush;

@end

@implementation PageCoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
}

- (void)setUpUI {
    self.title = @"翻页效果";
    self.view.backgroundColor = [UIColor greenColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"book.jpg"]];
    [self.view addSubview:imageView];
    imageView.frame = self.view.frame;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点我或者向左滑动" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(74);
    }];
    
    self.transitionPush = [WPYTransitionGesture WPYTransitionWithTransitionType:WPYTransitionTypePush GestureDirection:WPYTransitionGestureDirectionLeft];
    typeof(self) weakSelf = self;
    _transitionPush.push = ^() {
        [weakSelf push];
    };
    
    [self.transitionPush addPanGestureForViewController:self];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = back;
    
}

- (void)back {
    
    self.navigationController.delegate = nil;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)push {
    
    PageCoverPushVC *vc = [[PageCoverPushVC alloc] init];
    self.navigationController.delegate = vc;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPush {
    
    return _transitionPush;
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
