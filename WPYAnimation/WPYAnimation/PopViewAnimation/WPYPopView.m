//
//  WPYPopView.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYPopView.h"

@implementation WPYPopView




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
- (void)createExpendButtonWithNumber:(NSUInteger)number BtnWidth:(CGFloat)width Interval:(CGFloat)interval VerticalH:(CGFloat)verticalH Action:(SEL)action SuperVC:(UIViewController *)superVC {
    if (number != 0 && superVC != nil) {
        
        self.number = number;
        self.superVC = superVC;
        
        if (width == 0) {
            self.width = VIEW_W;
        }else {
            self.width = fabs(width);
        }
        
        if (interval == 0) {
            self.interval = Interval_H;
        }else {
        self.interval = fabs(interval) ;
            
        }
        
        if (verticalH == 0) {
            self.vertical_H = Vertical_H;
        }else {
            self.vertical_H = fabs(verticalH);
        }
        
        self.action = action;
        [self createSubView:action];
        
    }else {
        NSLog(@"Btn 个数为 0,请确认！！！");
        return;
    }
    
    
}

/**
 *  在父视图上添加弹出按钮
 *
 *  @param action 按钮点击要执行的事件 （注意： tag 从 100 开始）
 */
- (void)createSubView:(SEL)action{
    for (int i = 0; i < self.number; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*self.width + (i+1)*self.interval, self.superVC.view.frame.size.height, self.width, self.width);
        btn.layer.cornerRadius = self.width/2;
        btn.clipsToBounds = YES;
        btn.tag = 100 + i;
        btn.backgroundColor = [UIColor colorWithRed:ColorValue green:ColorValue blue:ColorValue alpha:ColorValue];
        [btn addTarget:self.superVC action:self.action forControlEvents:UIControlEventTouchUpInside];
        [self.superVC.view addSubview:btn];
    }
}

/**
 *  弹出按钮
 */
#define Frame 1
- (void)expand {
    
    for (int i = 0; i < 4; i++) {
        UIView *view = [self.superVC.view viewWithTag:100 + i];
        CGPoint center = view.center;
       
        [UIView animateWithDuration:0.5 delay:i*0.05 usingSpringWithDamping:0.5 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseInOut animations:^{
#if Frame
            //通过改变中心点来改变按钮的位置
            CGPoint changeCenter =  CGPointMake(center.x, center.y-self.vertical_H);
            view.center = changeCenter;
#else
            //transform 放射变换 修改位置
            view.transform = CGAffineTransformMakeTranslation(0, - self.vertical_H);
#endif
            
        } completion:nil];
    }
}

- (void)close {
    
    for (int i = 0; i < 4; i++) {
        UIView *view = [self.superVC.view viewWithTag:100 + i];
        CGPoint center = view.center;
        
        [UIView animateWithDuration:0.5 delay:i*0.05 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
#if Frame
            //通过改变中心点来改变按钮的位置
            CGPoint changeCenter =  CGPointMake(center.x, center.y + self.vertical_H);
            view.center = changeCenter;
#else
            //transform 放射变换 修改位置
            view.transform = CGAffineTransformIdentity;
#endif
            
        } completion:nil];
    }

}
@end
