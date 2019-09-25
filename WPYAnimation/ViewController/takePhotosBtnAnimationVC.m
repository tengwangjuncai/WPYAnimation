//
//  takePhotosBtnAnimationVC.m
//  WPYAnimation
//
//  Created by 王鹏宇 on 2018/7/26.
//  Copyright © 2018年 wpy. All rights reserved.
//

#import "takePhotosBtnAnimationVC.h"

@interface takePhotosBtnAnimationVC ()

@end

@implementation takePhotosBtnAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}


- (void)setup {
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect  frame = self.view.bounds;
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - 100)/2,frame.size.height/2 - 50, 100, 100)];
    [self.view addSubview:view];
  // view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
    
    UIBezierPath * starCircle = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:50];
    [starCircle appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:40 startAngle:0 endAngle:M_PI * 2 clockwise:NO]];

//    [starCircle appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:20 startAngle:0 endAngle:M_PI * 2 clockwise:NO]];
    
    UIBezierPath * endCircle = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:50];;
    [endCircle appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:48 startAngle:0 endAngle:M_PI * 2 clockwise:NO]];
    
//    [endCircle appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(42.5, 42.5, 15, 15) cornerRadius:0]];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = starCircle.CGPath;
    
    shapeLayer.fillMode = kCAFillModeForwards;
    shapeLayer.fillRule = @"even-odd";
    shapeLayer.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.4].CGColor;
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"path"];

    animation.fromValue = (__bridge id)(starCircle.CGPath);
    animation.toValue =(__bridge id)(endCircle.CGPath);
    animation.duration = 1;
    animation.repeatCount = NSNotFound;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [view.layer addSublayer:shapeLayer];
    
    UIView * btnLayer = [UIView new];
    //- M_PI*3/4  M_PI * 5 /4
    btnLayer.frame =CGRectMake(12, 12, 76, 76);
    btnLayer.layer.cornerRadius =40;
//    UIBezierPath *circle1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:40 startAngle: -  M_PI * 3 /4  endAngle:M_PI * 5/4  clockwise:YES];
//
//    UIBezierPath *circle2 =[UIBezierPath bezierPathWithRoundedRect:CGRectMake(35, 35, 30, 30) cornerRadius:0
                          //  ];// [UIBezierPath bezierPathWithRoundedRect:CGRectMake(35, 35, 30, 30) cornerRadius:1];
    //btnLayer.path = circle2.CGPath;
//    btnLayer.fillRule = @"";
//    btnLayer.fillColor = [UIColor redColor].CGColor;
    btnLayer.backgroundColor = [UIColor redColor];
   // [view.layer addSublayer:btnLayer];
    [view addSubview:btnLayer];
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    
//    animation2.fromValue = (__bridge id)(circle1.CGPath);
//    animation2.toValue =(__bridge id)(circle2.CGPath);
//    animation2.duration = 1;
//    animation2.autoreverses = NO;
//    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [btnLayer addAnimation:animation2 forKey:@""];
    
    [UIView animateWithDuration:0.5 animations:^{
        btnLayer.frame = CGRectMake(34, 34, 32, 32);
        btnLayer.layer.cornerRadius = 5;
        [self loadViewIfNeeded];
    } completion:^(BOOL finished){
         [shapeLayer addAnimation:animation forKey:@"Path"];
    }];
   
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
