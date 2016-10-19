//
//  RoundWaterLinesViewController.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/13.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "RoundWaterLinesViewController.h"
#import "WPYCircelWaveAnimationView.h"
@interface RoundWaterLinesViewController ()
@property (nonatomic, strong)WPYCircelWaveAnimationView *waveView;
@property (nonatomic, assign) BOOL flag;
@end

@implementation RoundWaterLinesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createWaveView];
    [self createBtn];
}

- (void)createWaveView {
    self.waveView = [[WPYCircelWaveAnimationView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.waveView.center = self.view.center;
    self.waveView.numberOfItem = 10;
    [self.view addSubview:self.waveView];
    [self.waveView startAnimation];
}

- (void)createBtn {
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake((self.view.frame.size.width - 200)/2, self.view.frame.size.height - 60, 200, 44);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"暂停" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClicked:(UIButton *)btn {
    if (!_flag) {
        [self.waveView stopAnimation];
        [btn setTitle:@"开始" forState:UIControlStateNormal];
    }else {
        [self.waveView startAnimation];
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
