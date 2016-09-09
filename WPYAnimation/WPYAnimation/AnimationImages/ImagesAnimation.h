//
//  ImagesAnimation.h
//  WPYAnimation
//
//  Created by wpy on 16/8/1.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangeLocation)(NSTimer *timer);
@interface ImagesAnimation : UIImageView
@property (nonatomic) ChangeLocation cLocation;
@property (nonatomic) NSTimeInterval duration;
@property (nonatomic,strong)NSTimer *timer;

/**
 *  创建图片动画imageView
 *
 *  @param imageNames 图片的名字
 *  @param frame      imageView的frame
 *  @param interval   图片间的时间间隔
 *
 *  @return 返回图片动画
 */
+(ImagesAnimation *)imagesAnimationViewWithImageNameArray:(NSArray *)imageNames frame:(CGRect)frame animationDuration:(NSTimeInterval)interval;

/**
 *  创建定时器  使图片动画移动 造成形象动画
 *
 *  @param time      时间间隔
 *  @param userInfo  信息
 *  @param repeat    重复次数
 *  @param cLocation 改变位置的block  （可以在里面可以具体改变其位置）
 */
- (void)createTimerWithInterval:(NSTimeInterval)time userInfo:(id)userInfo repeats:(BOOL)repeat ChangeLocation:(ChangeLocation)cLocation;
@end
