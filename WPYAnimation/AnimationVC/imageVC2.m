//
//  imageVC2.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "imageVC2.h"

@interface imageVC2 ()

@end

@implementation imageVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:backgroundImageView];
    
    [self createView];
    // Do any additional setup after loading the view.
}

- (void)createView {
    self.imagesAnimation = [ImagesAnimation imagesAnimationViewWithImageNameArray:@[@"runner0.jpg",@"runner1.jpg",@"runner2.jpg",@"runner3.jpg",@"runner4.jpg",@"runner5.jpg"] frame:CGRectMake(-200, self.view.frame.size.height + 200, 200, 200) animationDuration:0.5];
    
    self.imagesAnimation.alpha = 0.1;
    [self.view addSubview:self.imagesAnimation];
    [self.imagesAnimation createTimerWithInterval:0.01 userInfo:nil repeats:YES ChangeLocation:^(NSTimer *timer) {
        [self changelocation];
           }];
    //[self.imagesAnimation.timer setFireDate:[NSDate distantPast]];
}
- (void)changelocation {
    CGRect temp = self.imagesAnimation.frame;
    temp.origin.x +=1;
    if (temp.origin.x>=self.view.frame.size.width) {
        temp.origin.x = -200;
    }
    self.imagesAnimation.frame = temp;
    [UIView  animateWithDuration:7.0 animations:^{
        CGRect temp1 = self.imagesAnimation.frame;
        temp1.origin.y =430;
        temp1.size.height =80;
        temp1.size.width =80;
        self.imagesAnimation.frame = temp1;
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
