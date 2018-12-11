//
//  WPYCircleView.m
//  WPYAnimation
//
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYCircleView.h"

@implementation WPYCircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    _circelColor = [UIColor blueColor];
}


- (void)drawRect:(CGRect)rect {
    [self drawCircle:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))];
}

- (void)drawCircle:(CGPoint)location {
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    /*
     按照文档中的说法，系统会维护一个CGContextRef的栈，而UIGraphicsGetCurrentContext()会取栈顶的CGContextRef，
     
     正确的做法是只在drawRect里调用UIGraphicsGetCurrentContext()，
     
     因为在drawRect之前，系统会往栈里面压入一个valid的CGContextRef，
     
     除非自己去维护一个CGContextRef，否则不应该在其他地方取CGContextRef。
     */
    CGRect bounds =  self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.width/2.0;
    CGContextSaveGState(ref);
    
    CGContextSetLineWidth(ref, 5);
    CGContextSetFillColorWithColor(ref, _circelColor.CGColor);
    CGContextAddArc(ref, location.x, location.y, MIN(bounds.size.height, bounds.size.width)/2.0, 0.0, M_PI * 2, YES);
    CGContextFillPath(ref);
}
@end
