//
//  WPYTransition.m
//  WPYAnimation
//
//  Created by 又一车－UI on 16/8/9.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "WPYTransition.h"

#import "CircleSpreadVC.h"
#import "WPYTabBarController.h"
#import "MagicalMoveVC.h"
#import "MagicalMovePushVC.h"
#import "MagicalMoveCell.h"
#import "textViewVC.h"
#import "LoginViewAnimationVC.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation WPYTransition
/**

 *   设定转场类型
 *  @param type
 *
 *  @return
 */
+ (instancetype)WPYCtransitionWithTransitionType:(WPYCTransitionType)type {
    return [[self alloc] initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(WPYCTransitionType)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

/**
 *  设定某个view的相对固定点
 *
 *  @param point 固定点位置
 *  @param View  指定View
 */
- (void)setAnchorPointTo:(CGPoint)point withView:(UIView *)View{
    View.frame = CGRectOffset(View.frame, (point.x - View.layer.anchorPoint.x) * View.frame.size.width, (point.y - View.layer.anchorPoint.y) * View.frame.size.height);
    View.layer.anchorPoint = point;
}

/**
 *  设定转场时间
 *
 *  @param transitionContext 转场的上下文
 *
 *  @return 时间
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (_type) {
        case WPYMagicTransitionTypePush:
            
        case WPYMagicTransitionTypePop:
        {
            return 0.75;
        }
            break;
        case WPYPopTransitionPresent:
        {
            return 0.5;
        }
            break;
        case WPYPopTransitionDismiss:
        {
            return 0.25;
        }
            break;
        case WPYPageCoverTransitionPush:
        
        case WPYPageCoverTransitionPop:
        {
            return 1;
        }
            break;
        case WPYCircleSpreadTransitionPresent:
        
        case WPYCircleSpreadTransitionDismiss:
        {
            return 0.5;
        }
            break;
        case WPYPrintPaperTransitionPresent:
        case WPYPrintPaperTransitionDismiss:
        {
            return 2.5;
        }
            break;
        default:
            return 0.5;
            break;
    }
}

/**
 *  转场动画的具体操作在这儿进行
 *
 *  @param transitionContext 上下文
 */

//@protocol UIViewControllerContextTransitioning 这个接口中最重要的方法有:

//1 -(UIView *)containerView; VC切换所发生的view容器，开发者应该将切出的view移除，将切入的view加入到该view容器中。
//2 -(UIViewController *)viewControllerForKey:(NSString *)key; 提供一个key，返回对应的VC。现在的SDK中key的选择只有UITransitionContextFromViewControllerKey和UITransitionContextToViewControllerKey两种，分别表示将要切出和切入的VC。
//3 -(CGRect)initialFrameForViewController:(UIViewController *)vc; 某个VC的初始位置，可以用来做动画的计算。
//4 -(CGRect)finalFrameForViewController:(UIViewController *)vc; 与上面的方法对应，得到切换结束时某个VC应在的frame。
//5 -(void)completeTransition:(BOOL)didComplete; 向这个context报告切换已经完成。


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (_type) {
        case WPYMagicTransitionTypePush:
        {
            [self MagicalMovePushAnimation:transitionContext];
        }
            break;
        case WPYMagicTransitionTypePop:
        {
            [self MagicalMovePopAnimation:transitionContext];
        }
            break;
        case WPYPopTransitionPresent:
        {
            [self PopViewPresentAnimation:transitionContext];
        }
            break;
        case WPYPopTransitionDismiss:
        {
            [self PopViewDismissAnimation:transitionContext];
        }
            break;
        case WPYPageCoverTransitionPush:
        {
            [self PageCoverPushAnimation:transitionContext];
        }
            break;
        case WPYPageCoverTransitionPop:
        {
            [self PageCoverPopAnimation:transitionContext];
        }
            break;
        case WPYCircleSpreadTransitionPresent:
        {
            [self CircleSpreadPresentAnimation:transitionContext];
        }
            break;
        case WPYCircleSpreadTransitionDismiss:
        {
            [self CircleSpreadDismissAnimation:transitionContext];
        }
            break;
        case WPYPrintPaperTransitionPresent:
        {
            [self PrintPaperPresentAnimation:transitionContext];
        }
            break;
        case WPYPrintPaperTransitionDismiss:
        {
            [self PrintPaperDismissAnimation:transitionContext];
        }
            break;
        default:
            break;
    }
}


#pragma  mark - 圆扩散的 dismiss 动画

- (void)CircleSpreadDismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UINavigationController *toVC = ((WPYTabBarController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]).viewControllers[3];
    CircleSpreadVC *vc = toVC.viewControllers.lastObject;
    UIView *containerView = [transitionContext containerView];
    //画两个圆路径
    CGFloat radius = sqrtf(containerView.frame.size.height * containerView.frame.size.height + containerView.frame.size.width * containerView.frame.size.width) / 2;
    UIBezierPath *startCycle = [UIBezierPath bezierPathWithArcCenter:containerView.center radius:radius startAngle:0 endAngle:M_PI *2  clockwise:YES];
    UIBezierPath *endCycle =  [UIBezierPath bezierPathWithOvalInRect:vc.btnFrame];
    //创建CAShapeLayer进行遮盖
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillColor = [UIColor greenColor].CGColor;
    maskLayer.path = endCycle.CGPath;
    fromVC.view.layer.mask = maskLayer;
    //创建路径动画
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.delegate = self;
    maskLayerAnimation.fromValue = (__bridge id)(startCycle.CGPath);
    maskLayerAnimation.toValue = (__bridge id)((endCycle.CGPath));
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [maskLayerAnimation setValue:transitionContext forKey:@"transitionContext"];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
}

#pragma  mark - 圆扩散的 push 动画
- (void)CircleSpreadPresentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UINavigationController *fromVC = ((WPYTabBarController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]).viewControllers[3];
    
     CircleSpreadVC * VC = fromVC.viewControllers.lastObject;
    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    //画两个圆路径
    UIBezierPath *startCycle = [UIBezierPath bezierPathWithOvalInRect:VC.btnFrame];
    CGFloat x = MAX(VC.btnFrame.origin.x, containerView.frame.size.width - VC.btnFrame.origin.x);
    
    CGFloat y = MAX(VC.btnFrame.origin.y, containerView.frame.size.height - VC.btnFrame.origin.y);
    CGFloat radius = sqrtf(pow(x, 2) + pow(y, 2));
    UIBezierPath *endCycle = [UIBezierPath bezierPathWithArcCenter:containerView.center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    //创建CAShapeLayer进行遮盖
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endCycle.CGPath;
    //将maskLayer作为toVC.view 的遮盖
    toVC.view.layer.mask = maskLayer;
    
    //创建路径动画
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.delegate = self;
    //动画是加在layer上的 所以必须为CGPath，在将CGPath桥接为对象
    maskLayerAnimation.fromValue = (__bridge id)(startCycle.CGPath);
    maskLayerAnimation.toValue = (__bridge id)(endCycle.CGPath);
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [maskLayerAnimation setValue:transitionContext forKey:@"transitionContext"];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"Path"];
    
}

#pragma  mark - 神奇移动的 pop 动画

- (void)MagicalMovePopAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    MagicalMovePushVC *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    MagicalMoveVC *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //获取转场前点击的cell
    MagicalMoveCell *cell = (MagicalMoveCell *)[toVC.collectionView cellForItemAtIndexPath:toVC.currentIndexPath];
    //获取containnerView
    UIView *containerView = [transitionContext containerView];
    UIView *MoveView = containerView.subviews.lastObject;
    //设置转场前的状态
    cell.IconImageView.hidden = YES;
    fromVC.imageView.hidden = YES;
    MoveView.hidden = NO;
    [containerView insertSubview:toVC.view atIndex:0];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        MoveView.frame = [cell.IconImageView convertRect:cell.IconImageView.bounds toView:containerView];
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        //由于加入了手势 所以要进行判断
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            //取消手势 所以之前隐藏的东西要在显示出来就是不转场了
            MoveView.hidden = YES;
            fromVC.imageView.hidden = NO;
           // fromVC.view.alpha = 1;
        }else {
            //手势完成 也就是完成了转场要把cell 的界面显示出来 同事把过度界面删除（因为每次push的时候会创建）
            cell.IconImageView.hidden = NO;
            [MoveView removeFromSuperview];
        }
    }];
}

#pragma  mark - 神奇移动的 push 动画

- (void)MagicalMovePushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    MagicalMoveVC *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    MagicalMovePushVC *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //获取当前点击的cell
    MagicalMoveCell *cell = (MagicalMoveCell *)[fromVC.collectionView cellForItemAtIndexPath:fromVC.currentIndexPath];
    //获取containnerView
    UIView *containerView = [transitionContext containerView];
    //用snapshotViewAfterScreenUpdates 对cell的imageView截图保存成另一个视图 用于移动过渡
    UIView *MoveView = [cell.IconImageView snapshotViewAfterScreenUpdates:NO];
    //将点击的cell中的视图转换到当前控制器的坐标 （得到点击视图在整个view中的位置信息并且赋值给快照，再把cell中的imageView隐藏，你看到的视图上的是新生成的快照，而不是点击的cell的视图了）
    MoveView.frame = [cell.IconImageView convertRect:cell.IconImageView.bounds toView:containerView];
    //设置各个控件的状态
    cell.IconImageView.hidden = YES;
    toVC.view.alpha = 0;
    toVC.imageView.hidden = YES;
    //MoveView 要保证添加在最前方
    [containerView addSubview:toVC.view];
    [containerView addSubview:MoveView];
    //开始做动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:.55 initialSpringVelocity:1/0.55 options:0 animations:^{
        MoveView.frame = [toVC.imageView convertRect:toVC.imageView.bounds toView:containerView];
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        MoveView.hidden = YES;
        toVC.imageView.hidden = NO;
        //如果动画取消了就标记不完成，否则完成。这里可以直接设成Yes 因为在此没有手势过渡
        //如果有过渡才需要判断，必须标记，否则系统不会完成动画 就会出现不能交互的bug
        
        [transitionContext completeTransition:YES];
    }];
}

#pragma mark -- 打印机转场Present动画
- (void)PrintPaperPresentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    //获取转场前后的两个控制器
    UINavigationController *fromVC = ((WPYTabBarController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]).viewControllers[4];
    
    LoginViewAnimationVC * VC = fromVC.viewControllers.lastObject;
    textViewVC * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //******************************************************************************************************
    //因为有两个模块用到了这个 LoginViewAnimationVC 用于区分是哪个一个模块的（避免崩溃）如果你只用一次 就不用这部分了
    if (![VC isKindOfClass:[LoginViewAnimationVC class]]) {
        fromVC = ((WPYTabBarController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]).viewControllers[3];
        VC = fromVC.viewControllers.lastObject;
    }
    //*******************************************************************************************************
    UIView *containerView = [transitionContext containerView];
    
    UIView *moveView = [VC.loginView.printerImageView snapshotViewAfterScreenUpdates:NO];
    moveView.frame = [VC.loginView.printerImageView convertRect:VC.loginView.printerImageView.bounds toView:containerView];
    
    UIView *newView = [toVC.view snapshotViewAfterScreenUpdates:YES];
    newView.layer.borderWidth = 1;
    newView.layer.borderColor = [UIColor blackColor].CGColor;
    newView.frame = CGRectMake(60, 120, [UIScreen mainScreen].bounds.size.width - 120, 0);
    toVC.view.hidden = YES;
    [containerView addSubview:toVC.view];
    [containerView addSubview:moveView];
    [containerView addSubview:newView];
    
    //开始动画//delay:0 usingSpringWithDamping:1 initialSpringVelocity:1
    [UIView animateWithDuration:1.5  animations:^{
        newView.frame = CGRectMake(60, 120, [UIScreen mainScreen].bounds.size.width - 120,(ScreenWidth - 120 )/ScreenWidth * ScreenHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            newView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        } completion:^(BOOL finished) {
            moveView.hidden = YES;
            [newView removeFromSuperview];
            toVC.view.hidden = NO;
            [transitionContext completeTransition:YES];
        }];
    }];
}

#pragma mark - 打印机转场 dismiss 动画
-(void)PrintPaperDismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    textViewVC * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UINavigationController * Nav = ((WPYTabBarController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]).viewControllers[4];
    LoginViewAnimationVC * toVC = Nav.viewControllers.lastObject;
    UIView * containerView = [transitionContext containerView];
    containerView.backgroundColor = [UIColor whiteColor];
    UIView *MoveView = containerView.subviews.lastObject;
    UIView *oldView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    oldView.layer.borderWidth = 1;
    oldView.layer.borderColor = [UIColor blackColor].CGColor;
    MoveView.hidden = NO;
    oldView.frame = [fromVC.view convertRect:fromVC.view.frame toView:containerView];
    [containerView addSubview:oldView];
    toVC.view.hidden = YES;
    fromVC.view.hidden = YES;
    [UIView animateWithDuration:1  animations:^{
        oldView.frame = CGRectMake(60, 120, [UIScreen mainScreen].bounds.size.width - 120,(ScreenWidth - 120 )/ScreenWidth * ScreenHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
           oldView.frame = CGRectMake(60, 120, [UIScreen mainScreen].bounds.size.width - 120,0);
        } completion:^(BOOL finished) {
            oldView.hidden = YES;
            MoveView.hidden = YES;
            [oldView removeFromSuperview];
            [MoveView removeFromSuperview];
            toVC.view.hidden = NO;
            [transitionContext completeTransition:YES];
        }];
    }];
}


#pragma  mark - 弹出转场 present 动画

- (void)PopViewPresentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //获取转场前后的两个控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //由于在手势过度中直接使用fromVC 动画和手势有冲突，如果不需要实现手势的话，就可以不用截图了。为了解决这个问题可以用snapshotViewAfterScreenUpdates 对fromVC截图采用截图来代替fromVC做动画 就解决了冲突问题
    UIView *MoveView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    //因为我们要用截图来做转场动画所以fromVC 就可以直接隐藏了
    fromVC.view.hidden = YES;
    
    //containerView管理所有的转场动画的视图 所以要对视图做转场动画，视图就必须加入containerView中才能进行
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:MoveView];
    [containerView addSubview:toVC.view];
    
    //在这里你可以设置toVC的frame 你可以控制他的初始位置 和 弹出后的高度和宽度 如果不做设置默认是整个屏幕
    toVC.view.frame = CGRectMake(0, containerView.frame.size.height, containerView.frame.size.width, 400);
    
    //开始动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:.55 initialSpringVelocity:1.0 / 0.55 options:0 animations:^{
        //首先让toVC上移 即转场出现
        toVC.view.transform = CGAffineTransformMakeTranslation(0, - 400);
        //与此同时让fromView 视图缩小一点 在这里是（代替它的）MoveView 造成一种后移的假象
        MoveView.transform = CGAffineTransformMakeScale(0.85, 0.85);
        
    } completion:^(BOOL finished) {
        //[transitionContext transitionWasCancelled] 来表示转场手势是否完成 完成就代表完成了转场  否则没有完成转场。
        //对于是否完成转场一定要给予结果，否则会出现，界面不能交互的情况。！！！！！！！
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        if ([transitionContext transitionWasCancelled]) {
            //如果转场失败 就把视图还原 不转场
            fromVC.view.hidden = NO;
            //记得要把快照视图MoveView 移除  因为下次触发转场会再次截图
            [MoveView removeFromSuperview];
        }
        
    }];
}

#pragma  mark - 弹出转场 dismiss 动画

- (void)PopViewDismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //注意  这是虽然获取 fromVC toVC 的方法是一样的但是这时的两个位置与之前的两个是对调的
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    UIView * MoveView = containerView.subviews[containerView.subviews.count - 2];
    //开始动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.transform = CGAffineTransformIdentity;
        MoveView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            //转场失败
            [transitionContext completeTransition:NO];
        }else {
            //转场成功  因为转场之前我们让第一个view 隐藏了  完成回来时就应该使其再次显示出来
            [transitionContext completeTransition:YES];
            toVC.view.hidden = NO;
            [MoveView removeFromSuperview];
        }
    }];
}

#pragma  mark - 翻页转场 push 动画

- (void)PageCoverPushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //把当前页面做成快照来完成动画（避免程序出现bug）
    UIView *CoverPageView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    CoverPageView.frame = fromVC.view.frame;
    //获取做动画的页面 一般动画都放在 containerView 中
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView addSubview:CoverPageView];
    fromVC.view.hidden = YES;
    [containerView insertSubview:toVC.view atIndex:0];
    //设置相对固定点
    [self setAnchorPointTo:CGPointMake(0, 0.5) withView:CoverPageView];
    //设置三维旋转
    CATransform3D transform3D = CATransform3DIdentity;//单位矩阵
    transform3D.m34 = - 0.002;//m34（透视效果，要操作的这个对象要有旋转的角度，否则没有效果。正直/负值都有意义）
    containerView.layer.sublayerTransform = transform3D;
    //增加阴影效果
    CAGradientLayer *fromGradient = [CAGradientLayer layer];//可以方便的处理颜色渐变
    fromGradient.frame = fromVC.view.bounds;
    fromGradient.colors = @[(id)[UIColor blackColor].CGColor, (id)[UIColor blackColor].CGColor];
    fromGradient.startPoint = CGPointMake(0.0, 0.5);
    fromGradient.endPoint = CGPointMake(0.8, 0.5);
    
    UIView *fromShadow = [[UIView alloc] initWithFrame:fromVC.view.bounds];
    fromShadow.backgroundColor = [UIColor clearColor];
    [fromShadow.layer insertSublayer:fromGradient atIndex:1];
    fromShadow.alpha = 0.0;
    [CoverPageView addSubview:fromShadow];
    CAGradientLayer *toGradient = [CAGradientLayer layer];
    toGradient.frame = toVC.view.bounds;
    toGradient.colors = @[(id)[UIColor blackColor].CGColor,
                          (id)[UIColor blackColor].CGColor];
    toGradient.startPoint = CGPointMake(0.0, 0.5);
    toGradient.endPoint = CGPointMake(0.8, 0.5);
    UIView *toShadow = [[UIView alloc]initWithFrame:fromVC.view.bounds];
    toShadow.backgroundColor = [UIColor clearColor];
    [toShadow.layer insertSublayer:toGradient atIndex:1];
    toShadow.alpha = 1.0;
    [toVC.view addSubview:toShadow];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        CoverPageView.layer.transform = CATransform3DMakeRotation(- M_PI_2, 0, 1, 0);
        fromShadow.alpha = 1.0;
        toShadow.alpha = 0.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            [CoverPageView removeFromSuperview];
            fromVC.view.hidden = NO;
        }
    }];
}

#pragma  mark - 翻页转场 pop 动画

- (void)PageCoverPopAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    //拿到push的时候的快照
    UIView *CoverPageView = containerView.subviews.lastObject;
    [containerView addSubview:toVC.view];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        CoverPageView.layer.transform = CATransform3DIdentity;
        fromVC.view.subviews.lastObject.alpha = 1.0;
        CoverPageView.subviews.lastObject.alpha = 0.0;
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else {
            [transitionContext completeTransition:YES];
            [CoverPageView removeFromSuperview];
            toVC.view.hidden =NO;
        }
    }];
}

// 可以在这里执行动画结束的操作

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    switch ((int)_type) {
        case WPYCircleSpreadTransitionPresent:{
            id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
            [transitionContext completeTransition:YES];
            //            [transitionContext viewControllerForKey:UITransitionContextToViewKey].view.layer.mask = nil;
        }
            break;
        case WPYCircleSpreadTransitionDismiss:{
            id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            if ([transitionContext transitionWasCancelled]) {
                [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
            }
        }
            break;
    }

}
@end
