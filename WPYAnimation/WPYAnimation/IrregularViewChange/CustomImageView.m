//
//  CustomImageView.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/10/26.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (point.x < self.frame.size.width && point.y < self.frame.size.height) {
        unsigned char pixel[1] = {0};
        CGContextRef context = CGBitmapContextCreate(pixel,
                                                     1, 1, 8, 1, NULL,
                                                     kCGImageAlphaOnly);
        UIGraphicsPushContext(context);
        [self.image drawAtPoint:CGPointMake(-point.x, -point.y)];
        UIGraphicsPopContext();
        CGContextRelease(context);
        CGFloat alpha = pixel[0]/255.0f;
        BOOL transparent = alpha < 0.01f;
        return !transparent;

    }
    
    return false;
//    CGPoint shoulderPoint = [self getNewPoint:point SetImage:_shouldImage];
//    if(CGRectContainsPoint(self.bounds,shoulderPoint)) {
//        if ([self isAplphaSetPoint:shoulderPoint andSetImage:self]) {
//           
//            return YES;
//        }
//    }
//    return YES;
}


-(CGPoint) getNewPoint:(CGPoint) point SetImage:(UIImageView *) iv {
    return  CGPointMake(- point.x ,
                       - point.y );
}

-(BOOL) isAplphaSetPoint:(CGPoint) point andSetImage:(UIImageView *) iv {
    NSLog(@"point: %f", point.y);
    UIColor *uColor = [self colorAtPixel: point setImage: iv];
    const CGFloat *components = CGColorGetComponents(uColor.CGColor);
    if (NULL != components) {
        NSLog(@"Red: %f Green: %f Blue: %f alpha: %f", components[0], components[1], components[2], components[3]);
        float aplphaF = components[3];
        if ((aplphaF >= 0.5)) {
            return YES;
        }
    }
    return NO;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (UIColor *)colorAtPixel:(CGPoint)point setImage: (UIImageView *) iv {
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, iv.frame.size.width, iv.frame.size.height), point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = iv.image.CGImage;
    NSUInteger width = iv.frame.size.width;
    NSUInteger height = iv.frame.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 1;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


@end
