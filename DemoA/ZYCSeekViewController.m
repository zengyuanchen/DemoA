//
//  ZYCSeekViewController.m
//  DemoA
//
//  Created by 曾源琛 on 16/4/15.
//  Copyright © 2016年 zengyuanchen. All rights reserved.
//

#import "ZYCSeekViewController.h"

@interface ZYCSeekViewController ()

@property (nonatomic, strong) CAShapeLayer *maskLayer;

@end

@implementation ZYCSeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"遮罩";
    
    self.maskLayer = [CAShapeLayer layer];
    self.maskLayer.frame = self.view.bounds;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    [self doSomethingWithPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    [self doSomethingWithPoint:point];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    self.view.layer.mask = nil;
}

- (void)doSomethingWithPoint:(CGPoint)point{
    
    self.view.layer.mask = nil;
    
    
    //生成一个圆
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:60 startAngle:0 endAngle:2*M_PI clockwise:YES];
    self.maskLayer.path = path.CGPath;
    
    self.view.layer.mask = self.maskLayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
