//
//  MagnifierViewController.m
//  DemoA
//
//  Created by 曾源琛 on 16/4/15.
//  Copyright © 2016年 zengyuanchen. All rights reserved.
//

#import "ZYCMagnifierViewController.h"
#import "UIImage+ZYCScreenShot.h"

//放大镜的半径
static CGFloat kMagnifierRadius = 50.f;

@interface ZYCMagnifierViewController ()

@property (nonatomic, strong) UIImageView *zoomInImageView;

@end

@implementation ZYCMagnifierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"放大镜";
    
    self.zoomInImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 2*kMagnifierRadius, 2*kMagnifierRadius)];
    self.zoomInImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.zoomInImageView.layer.borderWidth = 0.5f;
    self.zoomInImageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.zoomInImageView.layer.cornerRadius = kMagnifierRadius;
    self.zoomInImageView.layer.masksToBounds = YES;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.zoomInImageView];
    
    self.zoomInImageView.alpha = 0.f;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    [self showZoomInViewFromPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    [self showZoomInViewFromPoint:point];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    
    self.zoomInImageView.alpha = 0.f;
}



- (void)showZoomInViewFromPoint:(CGPoint)point {
    
    NSLog(@"point = %@", NSStringFromCGPoint(point));
    //保留一份原始的point
    CGPoint position = CGPointMake(point.x, point.y);
    
    self.zoomInImageView.alpha = 0.f;
    
    UIImage *image = [UIImage printScreenFromView:self.view.window];
    
    //因为retina屏,截取到的图片的尺寸会变化
    point.x = [UIScreen mainScreen].scale * point.x;
    point.y = [UIScreen mainScreen].scale * point.y;
    
    //计算以触摸点为中心的矩形rect
    //乘以3而不乘以2的原因是想放大倍数小一点
    CGFloat width = 3*kMagnifierRadius;
    CGFloat height = width;
    CGRect rect = CGRectMake(point.x-0.5*width, point.y-0.5*height, width, height);
    NSLog(@"rect = %@", NSStringFromCGRect(rect));
    
    //截取rect范围的图片
    image = [image imageFromRect:rect];
    
    self.zoomInImageView.alpha = 1.f;
    self.zoomInImageView.image = image;
    
    CGPoint center = self.zoomInImageView.center;
    center.x = position.x;
    center.y = position.y - kMagnifierRadius;
    self.zoomInImageView.center = center;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end