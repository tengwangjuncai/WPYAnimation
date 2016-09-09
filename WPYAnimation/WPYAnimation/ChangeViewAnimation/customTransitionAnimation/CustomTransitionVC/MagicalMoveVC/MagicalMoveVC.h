//
//  MagicalMoveVC.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/15.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagicalMoveVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate>

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,assign)NSIndexPath *currentIndexPath;//记录当前indexPath
@end
