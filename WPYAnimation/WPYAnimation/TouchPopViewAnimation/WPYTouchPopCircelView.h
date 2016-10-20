//
//  WPYTouchPopCircelView.h
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPYTouchPopCircelView : UIView

@property (nonatomic, strong)UIViewController * superVC;

- (void)setFrame:(CGRect)frame withSuperView:(UIViewController *)superVC;
- (void)touchBegan:(NSSet<UITouch *> *)touches;
- (void)touchMove:(NSSet<UITouch *> *)touches;
- (void)touchEnd:(NSSet<UITouch *> *)touches;
@end
