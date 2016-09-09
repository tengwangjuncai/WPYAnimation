//
//  PageCoverPushVC.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/19.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageCoverPushVCDelegate <NSObject>

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPush;

@end

@interface PageCoverPushVC : UIViewController<UINavigationControllerDelegate>

@property (nonatomic, assign) id<PageCoverPushVCDelegate> delegate;

@end
