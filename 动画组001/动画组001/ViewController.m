//
//  ViewController.m
//  动画组001
//
//  Created by Minke on 2018/12/13.
//  Copyright © 2018 zzr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)test {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 200)];
    [bezierPath addCurveToPoint:CGPointMake(300, 200) controlPoint1:CGPointMake(100, 100) controlPoint2:CGPointMake(200, 300)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.strokeColor = UIColor.redColor.CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.fillColor = nil;
    [self.view.layer addSublayer:shapeLayer];
    
    // 设置colorlayer
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 66, 66);
    colorLayer.position = CGPointMake(50, 150);
    colorLayer.backgroundColor = color.CGColor;
    [self.view.layer addSublayer:colorLayer];
    
    //添加位置动画
    CAKeyframeAnimation *anim1 = [CAKeyframeAnimation animation];
    anim1.keyPath = @"position";
    anim1.path = bezierPath.CGPath;
    anim1.rotationMode = kCAAnimationRotateAuto;
    
    // 添加比例动画
    CABasicAnimation *anim2 = [CABasicAnimation animation];
    anim2.keyPath = @"transform.scale";
    anim2.toValue = @0.5;
    
    // 添加颜色动画
    CABasicAnimation *anim3 = [CABasicAnimation animation];
    anim3.keyPath = @"backgroundColor";
    anim3.toValue = (__bridge id _Nullable)(color.CGColor);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[anim1,anim2,anim3];
    group.duration = 4.0f;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [colorLayer addAnimation:group forKey:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test];
}


@end
