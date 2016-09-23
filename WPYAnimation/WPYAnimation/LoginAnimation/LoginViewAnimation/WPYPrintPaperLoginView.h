//
//  WPYPrintPaperLoginView.h
//  WPYAnimation
//
//  Created by 又一车－UI on 16/9/14.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^LoginAnimation)();
@protocol  WPYPrintPaperLoginViewDelegate<NSObject>

- (BOOL)loginWithUserName:(NSString *)userName PassWord:(NSString *)pw;
- (BOOL)registerSucceedWithUserName:(NSString *)userName PassWord:(NSString *)pw CertainPw:(NSString*)cpw PhioneNum:(NSString *)numStr;
- (void)loginSuccessToTransition;
@end
@interface WPYPrintPaperLoginView : UIView

@property (nonatomic, strong)UIImageView * printerImageView;
@property (nonatomic, unsafe_unretained) id<WPYPrintPaperLoginViewDelegate>delegate;

- (void)loginViewAppearAnimation;

@end
