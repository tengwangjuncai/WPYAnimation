//
//  PopViewPresentVC.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/17.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopViewPresentVCDelegate <NSObject>

- (void)popViewPresentVCDismiss;
- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent;

@end
@interface PopViewPresentVC : UIViewController
@property (nonatomic, assign)id<PopViewPresentVCDelegate> delegate;
@end
