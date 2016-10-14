//
//  3DCubeViewController.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/13.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "Cube3DViewController.h"
#import "WPYCubeAnimationLayer.h"
#import "WPY3DCubeAnimationView.h"
@interface Cube3DViewController ()
@property(nonatomic, strong) WPY3DCubeAnimationView *CubeView;
@end

@implementation Cube3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.CubeView = [[WPY3DCubeAnimationView alloc] initWithFrame:self.view.frame];//CGRectMake(150, 200, 200, 200)
    [self.view addSubview:self.CubeView];
    [self addPanGesture];
    [self.CubeView addTarget:self Action:@selector(btnClicked:)];

}
- (void)addPanGesture {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.CubeView addGestureRecognizer:pan];
}
- (void)pan:(UIPanGestureRecognizer *)recognizer{
    
    [self.CubeView pan:recognizer];
    
}
- (void)btnClicked:(UIButton *)btn {
    NSLog(@"点我干啥？");
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
