//
//  TouchPopViewViewController.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "TouchPopViewViewController.h"
#import "WPYTouchPopCircelView.h"
@interface TouchPopViewViewController ()

@property (nonatomic ,strong)WPYTouchPopCircelView * CircleView;
@end

@implementation TouchPopViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.CircleView = [[WPYTouchPopCircelView alloc] init];
    [self.CircleView setFrame:CGRectMake(0, 0, 50, 50) withSuperView:self];
    
}
- (void)updateFrame {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.CircleView touchBegan:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.CircleView touchMove:touches];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.CircleView touchEnd:touches];
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
