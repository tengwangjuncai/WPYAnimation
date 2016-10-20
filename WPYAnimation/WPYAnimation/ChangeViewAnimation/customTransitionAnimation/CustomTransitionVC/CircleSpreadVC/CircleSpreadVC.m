//
//  CircleSpreadVC.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "CircleSpreadVC.h"
#import "CircelSpreadPresentVC.h"
#import "Masonry.h"
@interface CircleSpreadVC ()
@property (nonatomic,weak) UIButton *button;
@end

@implementation CircleSpreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"Spread1"];
    [self.view addSubview:imageView];
    [self createButton];
}


- (void)createButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button = btn;
    [btn  setTitle:@"点击或\n拖动我" forState:UIControlStateNormal];
    btn.titleLabel.numberOfLines = 2;
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blackColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 20;
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(0, 0)).priorityLow();
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.left.greaterThanOrEqualTo(self.view);
        make.top.greaterThanOrEqualTo(self.view).offset(64);
        make.bottom.right.lessThanOrEqualTo(self.view);
    }];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.button addGestureRecognizer:pan];
    
}

- (CGRect)btnFrame {

    return self.button.frame;

}

- (void)present {
    CircelSpreadPresentVC *vc = [[CircelSpreadPresentVC alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    UIView *btn = pan.view;
    CGPoint newCenter = CGPointMake([pan translationInView:pan.view].x + btn.center.x - [UIScreen mainScreen].bounds.size.width / 2, [pan translationInView:pan.view].y + btn.center.y - [UIScreen mainScreen].bounds.size.height / 2);
    [btn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(newCenter).priorityLow();
    }];
    [pan setTranslation:CGPointZero inView:pan.view];
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
