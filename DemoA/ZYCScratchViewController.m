//
//  ZYCScratchViewController.m
//  DemoA
//
//  Created by 曾源琛 on 16/4/15.
//  Copyright © 2016年 zengyuanchen. All rights reserved.
//

#import "ZYCScratchViewController.h"
#import "UIImage+ZYCScreenShot.h"

@interface ZYCScratchViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *surfaceImageView;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) CAShapeLayer *maskLayer;
@property (nonatomic, strong) CALayer *imageLayer;
@property (nonatomic, strong) UIBezierPath *path;
@end

@implementation ZYCScratchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"刮刮乐";
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"重置" style:UIBarButtonItemStylePlain target:self action:@selector(reset)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"隐藏封面" style:UIBarButtonItemStylePlain target:self action:@selector(showOrHideLayer)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.maskLayer = [CAShapeLayer layer];
    self.maskLayer.lineCap = kCALineCapRound;
    self.maskLayer.lineJoin = kCALineJoinRound;
    self.maskLayer.lineWidth = 40.f;
    self.maskLayer.strokeColor = [UIColor redColor].CGColor;
    self.maskLayer.fillColor = nil;
    
    
    self.path = [UIBezierPath bezierPath];
    
    self.imageView.layer.mask = self.maskLayer;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.maskLayer.frame = self.view.bounds;

}

- (void)reset {
    self.path = [UIBezierPath bezierPath];
    self.maskLayer.path = NULL;
    self.imageView.layer.mask = self.maskLayer;
}

- (void)showOrHideLayer{
    if (self.imageView.layer.mask) {
        self.imageView.layer.mask = nil;
    }else{
        self.imageView.layer.mask = self.maskLayer;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    [self doSomethingWithBeginPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    [self doSomethingWithMovedPoint:point];
}

- (void)doSomethingWithBeginPoint:(CGPoint)point{
    
    [self.path moveToPoint:point];
    
    self.maskLayer.path = self.path.CGPath;
}

- (void)doSomethingWithMovedPoint:(CGPoint)point{
    
    [self.path addLineToPoint:point];
    
    self.maskLayer.path = self.path.CGPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
