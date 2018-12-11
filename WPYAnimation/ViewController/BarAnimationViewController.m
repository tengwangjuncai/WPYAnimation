//
//  BarAnimationViewController.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "BarAnimationViewController.h"
#import "WPYBarAnimationView.h"
@interface BarAnimationViewController ()
@property (nonatomic,strong) WPYBarAnimationView * barView;
@property (nonatomic, assign) BOOL flag;
@end

@implementation BarAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.barView = [[WPYBarAnimationView alloc] initWithFrame:CGRectMake(0, 0, 300, 120)];
    self.barView.center = self.view.center;
    [self.view addSubview:self.barView];
    [self createBtn];
    [self.barView startAnimation];
}

- (void)createBtn {
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake((self.view.frame.size.width - 200)/2, self.view.frame.size.height - 60, 200, 44);
    btn.backgroundColor = [UIColor blueColor];
    btn.titleLabel.textColor = [UIColor whiteColor];
    [btn setTitle:@"暂停" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)btnClicked:(UIButton *)btn {
    if (!_flag) {
        [self.barView stopAnimation];
        [btn setTitle:@"开始" forState:UIControlStateNormal];
    }else {
        [self.barView startAnimation];
        [btn setTitle:@"暂停" forState:UIControlStateNormal];
    }
    _flag = !_flag;
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
