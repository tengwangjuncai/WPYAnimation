//
//  ViewAnimation.h
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewAnimation : UIView

//宏定义背景动画类型
typedef enum {
    snowBackgroundView= 0,
    bubbleBackgroundView,
} backgroundViewAnimationType;
@property (nonatomic, copy) UIImage * animationImage;
@property (nonatomic)CGFloat width;
@property (nonatomic)NSTimeInterval interval;
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic)backgroundViewAnimationType bgViewType;

/**
 *  创建背景动画
 *
 *  @param image    背景移动的image
 *  @param width    imageWidth
 *  @param interval 时间间隔
 *  @param type     背景动画类型
 *  @param frame    背景的frame
 *
 *  @return 返回背景view
 */

// 只有执行此方法才能完成背景懂话的创建 而非一般的 init  initWithFrame

- (void)createBgAnimationWithAnimationImage:(UIImage *)image ImageWidth:(CGFloat)width TimeInterval:(NSTimeInterval)interval bgAnimationType:(backgroundViewAnimationType)type BgViewFrame:(CGRect)frame;
@end
