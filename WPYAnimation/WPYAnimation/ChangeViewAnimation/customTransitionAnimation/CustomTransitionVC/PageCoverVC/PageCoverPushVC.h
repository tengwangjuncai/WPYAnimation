//
//  PageCoverPushVC.h
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageCoverPushVCDelegate <NSObject>

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPush;

@end

@interface PageCoverPushVC : UIViewController<UINavigationControllerDelegate>

@property (nonatomic, assign) id<PageCoverPushVCDelegate> delegate;

@end
