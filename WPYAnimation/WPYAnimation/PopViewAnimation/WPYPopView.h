//
//  WPYPopView.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/8.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define VIEW_W  60
#define VIEW_H  60
#define Interval_H 30
#define Vertical_H 300

typedef enum {
    popViewFromTop=0,//从上弹出
    popViewFromright,//从右边弹出
    popViewFromleft,//从左边弹出
    popViewFrombottom,//从下边弹出
} PopViewAnimationType;


@interface WPYPopView : UIView
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat interval;
@property (nonatomic) NSUInteger number;
@property (nonatomic, strong) UIViewController * superVC;
@property (nonatomic) SEL action;
@property (nonatomic) CGFloat vertical_H;

//创建弹出按钮的唯一方法（必须实现）
/**
 *  配置弹出View各个参数，创建弹出View
 *
 *  @param number     弹出按钮的个数
 *  @param width      按钮的宽度
 *  @param interval   按钮间的间隔
 @param verticalH  按钮在父视图的垂直高
 *  @param action     按钮的点击事件
 *  @param super_View 按钮所在父视图
 */
- (void)createExpendButtonWithNumber:(NSUInteger)number BtnWidth:(CGFloat)width Interval:(CGFloat)interval VerticalH:(CGFloat)verticalH Action:(SEL)action SuperVC:(UIViewController *)superVC;

//弹出
- (void)expand;

//收缩
- (void)close;
@end
