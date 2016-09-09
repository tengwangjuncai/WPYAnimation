//
//  WPY3DCubeAnimationView.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/31.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPY3DCubeAnimationView : UIView

@property (nonatomic, strong)CATransformLayer  *contentLayer;

@property (nonatomic, strong)UIButton *topBtn;

@property (nonatomic, strong)UIButton *bottomBtn;

@property (nonatomic, strong)UIButton *leftBtn;

@property (nonatomic, strong)UIButton *rightBtn;

@property (nonatomic, strong)UIButton *frontBtn;

@property (nonatomic, strong)UIButton *backBtn;

- (void)pan:(UIPanGestureRecognizer *)recognizer;

- (void)addTarget:(id)target Action:(SEL)action;
@end
