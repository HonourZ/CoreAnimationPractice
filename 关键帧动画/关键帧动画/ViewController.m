//
//  ViewController.m
//  关键帧动画
//
//  Created by Minke on 2018/12/12.
//  Copyright © 2018 zzr. All rights reserved.
//

#import "ViewController.h"

#define angleToRadians(angle) ((angle) / 180.0 * M_PI)
/**
 添加动画3步骤：
 1.初始化动画对象
 2.设置动画属性
 3.添加动画到layer上
 
 关键帧动画可以通过2中方法做动画
 1. values
 2. path
 
 uiview:frame/bound/center
 layer:frame/bound/position/anchorPoint
 锚点： 就是移动图层的把柄，单位坐标 0-1
 position 就是秒点在父视图中的位置
 
 贝塞尔曲线就是通过控制点来画曲线的
 数据点
 控制点
 */
@interface ViewController ()
@property (strong, nonatomic)UIBezierPath *bezierPath;
@property (strong, nonatomic)CAShapeLayer *shapeLayer;
@property (strong, nonatomic)UIImageView *iconView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.iconView];
}

- (void)test {
    [self.view.layer addSublayer:self.shapeLayer];
    
    CALayer *carLayer = [CALayer layer];
    carLayer.frame = CGRectMake(0, 0, 36, 36);
    carLayer.anchorPoint = CGPointMake(0.4, 0.8);
    carLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"car"].CGImage);
    [self.view.layer addSublayer:carLayer];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = self.bezierPath.CGPath;
    anim.duration = 4.0f;
    anim.rotationMode = kCAAnimationRotateAuto;
    [carLayer addAnimation:anim forKey:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.values = @[@angleToRadians(-3),@angleToRadians(3),@angleToRadians(-3)];
    anim.repeatCount = MAXFLOAT;
    [self.iconView.layer addAnimation:anim forKey:nil];
//    [self test];
}

- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.path = self.bezierPath.CGPath;
        _shapeLayer.strokeColor = UIColor.redColor.CGColor;
        _shapeLayer.lineWidth = 2.0f;
        _shapeLayer.fillColor = nil;
    }
    return _shapeLayer;
}

- (UIBezierPath *)bezierPath {
    if (!_bezierPath) {
        _bezierPath = [UIBezierPath bezierPath];
        [_bezierPath moveToPoint:CGPointMake(20, 200)];
        [_bezierPath addCurveToPoint:CGPointMake(300, 200) controlPoint1:CGPointMake(100, 100) controlPoint2:CGPointMake(200, 300)];
    }
    return _bezierPath;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon支付宝"]];
        _iconView.frame = CGRectMake(134, 63, 120, 120);
    }
    return _iconView;
}

@end
