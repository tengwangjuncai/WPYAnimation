//
//  BackgroundVCViewController.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "BackgroundVCViewController.h"
#import "WPYPopView.h"
@interface BackgroundVCViewController ()
@property (nonatomic, strong)WPYPopView * popView;
@property (nonatomic)BOOL pop;

@end

@implementation BackgroundVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    
}

- (void)createView {
    
    if (self.type == 0) {
        
        ViewAnimation *view = [[ViewAnimation alloc] init];
        
        UIImage *image = [UIImage imageNamed:@"flake"];
        
        [view createBgAnimationWithAnimationImage:image ImageWidth:50 TimeInterval:0.5 bgAnimationType:self.type  BgViewFrame:self.view.frame];
        view.backgroundColor = [UIColor blackColor];
        [self.view addSubview:view];
    }else if (self.type == 1) {
        
        ViewAnimation *view = [[ViewAnimation alloc] init];
        
        UIImage *image = [UIImage imageNamed:@"qiu3.jpg"];
    
        [view createBgAnimationWithAnimationImage:image ImageWidth:50 TimeInterval:0.5 bgAnimationType:self.type  BgViewFrame:self.view.frame];
        view.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:view];
        
        if (self.str) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
            label.center = self.view.center;
            label.numberOfLines = 0;
            label.text = self.str;
            [self.view addSubview:label];
        }
    }else  {
        
       self.popView = [WPYPopView new];
        [self.popView createExpendButtonWithNumber:4 BtnWidth:60 Interval:30 VerticalH:300 Action:@selector(popbtnClicked:) SuperVC:self];
        
        self.pop = NO;
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(0, 0, 200, 44);
        btn.center = self.view.center;
        [btn setTitle:@"popView" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pop:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}

- (void)pop:(UIButton *)sender {
    if (!self.pop) {
        [self.popView expand];
    }else {
        [self.popView close];
    }
    self.pop = !self.pop;
}
//btn的tag值是从100 开始的
- (void)popbtnClicked:(UIButton *)btn {
    NSLog(@"你点击了第 %ld 个按钮",btn.tag - 100 + 1);
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
