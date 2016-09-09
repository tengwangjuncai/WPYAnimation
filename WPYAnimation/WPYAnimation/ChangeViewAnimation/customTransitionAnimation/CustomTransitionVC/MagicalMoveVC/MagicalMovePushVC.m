//
//  MagicalMovePushVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/15.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "MagicalMovePushVC.h"
#import "WPYTransitionGesture.h"
#import "Masonry.h"
#import "WPYTransition.h"
@interface MagicalMovePushVC ()
@property (nonatomic, strong)WPYTransitionGesture *transitionGesture;
@end

@implementation MagicalMovePushVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self setUpUI];
}
- (void)setUpUI {
    self.title = @"神奇转场";
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 280)];
    self.imageView.image = self.image;
    self.imageView.center = CGPointMake(self.view.center.x, self.view.center.y - 140);
    [self.view addSubview:self.imageView];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"向右滑动可以通过手势控制POP动画,达到神奇移动的效果";
    label.font = [UIFont systemFontOfSize:16];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero).priorityLow();
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(20);
        //make.width.mas_equalTo(self.imageView.mas_width);
        
    }];
    
    //初始化手势过度代理
    self.transitionGesture =  [WPYTransitionGesture WPYTransitionWithTransitionType:WPYTransitionTypePop GestureDirection:WPYTransitionGestureDirectionRight];
    //给当前控制器的属兔添加手势
    [self.transitionGesture addPanGestureForViewController:self];
}

#pragma mark --UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    //在push和pop两种情况下返回不同的动画操作
    return [WPYTransition WPYCtransitionWithTransitionType:operation == UINavigationControllerOperationPush ? WPYMagicTransitionTypePush : WPYMagicTransitionTypePop];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    return self.transitionGesture.isStart ? _transitionGesture : nil ;
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
