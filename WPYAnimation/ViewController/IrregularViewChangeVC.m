//
//  IrregularViewChangeVC.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/26.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "IrregularViewChangeVC.h"
#import "WPYIrregularViewChange.h"
@interface IrregularViewChangeVC ()

@end

@implementation IrregularViewChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
    [self createIrregularViewChange];
}


- (void)createIrregularViewChange {
    
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    
    WPYIrregularViewChange * view = [[WPYIrregularViewChange alloc] initWithFrame:CGRectMake(0, 100, viewSize.width,viewSize.width * 403 / 375)];
    view.superVC = self;
    [self.view addSubview:view];
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
