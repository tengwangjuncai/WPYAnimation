//
//  WPYIrregularViewChange.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/26.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYIrregularViewChange.h"
#import "CustomImageView.h"
#define HImageNames @[@"back_head_p",@"back_upper_limb_p",@"back_backside_p"]
#define ImageNames @[@"back_head",@"back_upper_limb",@"back_backside"]
@implementation WPYIrregularViewChange

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createImageView:ImageNames];
    }
    return self;
}

- (void)createImageView:(NSArray * )imageNameArray {
     CGSize viewSize = [UIScreen mainScreen].bounds.size;
    for (int i = 0; i < imageNameArray.count; i++) {
        UIImage * image = [UIImage imageNamed:imageNameArray[i]];
        CustomImageView * imageView = [[CustomImageView alloc] initWithFrame:CGRectMake(0, 0, viewSize.width,viewSize.width * 790 / 420)];
       imageView.image = [self  imageCompressForWidth:image targetWidth:viewSize.width];
//        CustomImageView * imageView = [[CustomImageView alloc] initWithImage:image];
        
       // imageView.image = [imageView scaleToSize:self.bounds.size];
//        imageView.backgroundColor = [UIColor colorWithPatternImage:[self  imageCompressForWidth:image targetWidth:viewSize.width]];
        imageView.tag = i + 100;
        imageView.userInteractionEnabled = YES;
        [self addTapWith:imageView];
        [self addSubview:imageView];
    }
}
- (UIImage *)scaleImage:(UIImage *)image ToSize:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}
-(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        
        NSLog(@"scale image fail");
    }
    UIGraphicsEndImageContext();
    return newImage;
}
- (void)addTapWith:(UIImageView *)imageView {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [imageView addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer *)sender {
    CustomImageView * imageView = (CustomImageView *)sender.view;
    NSString * imageName;
    if (!imageView.flag) {
        
        imageName = HImageNames[imageView.tag - 100];
        imageView.flag = YES;
    }else {
        imageName = ImageNames[imageView.tag - 100];
        imageView.flag = NO;
    }
//    imageView.backgroundColor = [UIColor colorWithPatternImage:[self imageCompressForWidth:[UIImage imageNamed:imageName] targetWidth:self.frame.size.width]];
    imageView.image = [self imageCompressForWidth:[UIImage imageNamed:imageName] targetWidth:self.frame.size.width];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
