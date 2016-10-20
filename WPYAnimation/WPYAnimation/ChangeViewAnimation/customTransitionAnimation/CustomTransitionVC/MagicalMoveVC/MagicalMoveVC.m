//
//  MagicalMoveVC.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "MagicalMoveVC.h"
#import "MagicalMoveCell.h"
#import "MagicalMovePushVC.h"
@interface MagicalMoveVC ()

@end

@implementation MagicalMoveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    
    UICollectionViewFlowLayout *layOut = [UICollectionViewFlowLayout new];
    layOut.itemSize = CGSizeMake(150, 180);
    layOut.minimumInteritemSpacing = 10;
    //设置内边距
    layOut.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
    layOut.minimumLineSpacing = 10;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layOut];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MagicalMoveCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.title = @"神奇移动";
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(MagicalBack)];
    self.navigationItem.leftBarButtonItem = back;
}

- (void)MagicalBack {
    self.navigationController.delegate = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MagicalMoveCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MagicalMoveCell * cell = (MagicalMoveCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.currentIndexPath = indexPath;
    MagicalMovePushVC * vc = [[MagicalMovePushVC alloc] init];
    vc.image = cell.IconImageView.image;
    //设置导航控制器的代理为推出的控制器，可以达到自定义不同的控制器的退出效果
    self.navigationController.delegate = vc;
    [self.navigationController pushViewController:vc animated:YES];
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
