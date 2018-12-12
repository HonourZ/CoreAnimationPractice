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
@property (strong, nonatomic)CAShapeLayer *shapeLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)test {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 200)];
    [bezierPath addCurveToPoint:CGPointMake(300, 300) controlPoint1:CGPointMake(100, 100) controlPoint2:CGPointMake(200, 300)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.strokeColor = UIColor.redColor.CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.fillColor = UIColor.yellowColor.CGColor;
    [self.view.layer addSublayer:shapeLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test];
}

- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        
    }
    return _shapeLayer;
}

@end
