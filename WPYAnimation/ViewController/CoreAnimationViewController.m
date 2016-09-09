//
//  CoreAnimationViewController.m
//  WPYAnimation
//
//  Created by wpy on 16/8/1.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "CoreAnimationViewController.h"
#import "WPYCubeAnimationLayer.h"
#import "WPY3DCubeAnimationView.h"
@interface CoreAnimationViewController ()
@property(nonatomic, strong) WPY3DCubeAnimationView *CubeView;
@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.CubeView = [[WPY3DCubeAnimationView alloc] initWithFrame:self.view.frame];//CGRectMake(150, 200, 200, 200)
    [self.view addSubview:self.CubeView];
    [self addPanGesture];
    [self.CubeView addTarget:self Action:@selector(btnClicked:)];
}

- (void)btnClicked:(UIButton *)btn {
    NSLog(@"点我干啥？");
}
- (void)addPanGesture {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.CubeView addGestureRecognizer:pan];
}
- (void)pan:(UIPanGestureRecognizer *)recognizer{
    
    [self.CubeView pan:recognizer];
 
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
