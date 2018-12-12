//
//  ViewController.m
//  coreAnimation01
//
//  Created by Minke on 2018/12/12.
//  Copyright © 2018 zzr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>
@property (strong, nonatomic)UIView *redView;
@property (strong, nonatomic)CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.redView];
    NSLog(@"%@",NSStringFromCGRect(self.redView.frame));
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = UIColor.yellowColor.CGColor;
    self.layer = layer;
    [self.view.layer addSublayer:layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position.y";
    anim.toValue = @400;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.delegate = self;
    anim.duration = 1;
    [self.redView.layer addAnimation:anim forKey:nil];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"begin");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"stop - %@", NSStringFromCGRect(self.redView.frame));
}


- (UIView *)redView{
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(10, 40, 100, 100)];
        _redView.backgroundColor = UIColor.redColor;
    }
    return _redView;
}


@end
