//
//  WPYDynamicsView.m
//  WPYAnimation
//
//  Created by 又一车－UI on 2016/12/6.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYDynamicsView.h"

@interface WPYDynamicsView(){
    UIDynamicAnimator* animator;//物理仿真器
    UIView *referenceView;//是一个参照视图，表示物理仿真的范围
}
@end
@implementation WPYDynamicsView

- (void)setUpWithAnchor:(CGPoint)anchor inView:(UIView *)view {
    
    self.backgroundColor = [UIColor orangeColor];
    referenceView = view;
    
    [self addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:referenceView];//创建物理仿真器
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self]];
    [animator addBehavior:_gravity];//创建重力行为
    
    _attach = [[UIAttachmentBehavior alloc] initWithItem:self offsetFromCenter:UIOffsetMake(0, - self.bounds.size.height * 0.5) attachedToAnchor:anchor];
    _attach.length = 100.0;
    _attach.damping = 0.1;
    _attach.frequency = 0.6;
    [animator addBehavior:_attach];
    
    _itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self]];
    _itemBehavior.elasticity = 0.6;
    [animator addBehavior:_itemBehavior];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
}


#pragma mark - line property
- (void)setLineLength:(CGFloat)lineLength {
    _lineLength = lineLength;
    _attach.length = lineLength;
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    _lineLayer.lineWidth = _lineWidth;
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    _lineLayer.strokeColor = _lineColor.CGColor;
}

- (void)setDamping:(CGFloat)damping {
    if (0 <= damping && damping <= 1) {
        _damping =damping;
        _attach.damping = damping;
    }
}

#pragma mark - line

-(CAShapeLayer *)lineLayer {
    if (nil == _lineLayer) {
        _lineLayer = [CAShapeLayer layer];
        _lineLayer.strokeColor = _lineColor.CGColor?:[UIColor redColor].CGColor;
        _lineLayer.fillColor = [UIColor clearColor].CGColor;
        _lineLayer.lineWidth = _lineWidth?:1.5;
        _lineLayer.lineJoin = kCALineJoinRound;
        _lineLayer.strokeEnd = 3.0f;
        [referenceView.layer addSublayer:_lineLayer];
    }
    return _lineLayer;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    [self updateLine];
}

- (void)updateLine {
    CGPoint platePoint = [referenceView convertPoint:CGPointMake(CGRectGetMidX(self.bounds), 0) fromView:self];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:_attach.anchorPoint];
    [bezierPath addLineToPoint:platePoint];
    self.lineLayer.path = bezierPath.CGPath;
}

#pragma mark - 手势响应事件

- (void)tap:(UIGestureRecognizer *)tap {
    if (nil != _tapBlock) {
        _tapBlock();
    }
}

- (void)pan:(UIGestureRecognizer *)pan {
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            [animator removeAllBehaviors];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint point = [pan locationInView:referenceView];
            self.center = point;
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [animator addBehavior:_gravity];
            [animator addBehavior:_attach];
        }
            break;
        default:
            break;
    }
}
@end
