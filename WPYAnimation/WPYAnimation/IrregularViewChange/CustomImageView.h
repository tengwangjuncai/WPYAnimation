//
//  CustomImageView.h
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/26.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomImageView : UIImageView
@property (nonatomic, assign)BOOL flag;
@property (nonatomic, strong)UIImageView *shouldImage;

- (UIImage *)scaleToSize:(CGSize)size;
@end
