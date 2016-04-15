//
//  UIImage+ZYCScreenShot.m
//  DemoA
//
//  Created by 曾源琛 on 16/4/15.
//  Copyright © 2016年 zengyuanchen. All rights reserved.
//

#import "UIImage+ZYCScreenShot.h"

@implementation UIImage (ZYCScreenShot)

//获取指定rect区域的截图
- (UIImage *)imageFromRect:(CGRect)rect {
    if (CGRectEqualToRect(rect, CGRectNull) || CGRectEqualToRect(rect, CGRectZero)) {
        return self;
    }
    CGImageRef ref = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [[UIImage alloc] initWithCGImage:ref];
    CGImageRelease(ref);
    return image;
}

//获取指定mask的截图
//- (UIImage *)imageFromMask:(CALayer *)mask {
//
//    UIBezierPath
//    CGImageRef ref = CGImageCreateWithMask(self.CGImage, mask);
//    UIImage *image = [[UIImage alloc] initWithCGImage:ref];
//    return image;
//}


//截屏
+ (UIImage *)printScreenFromView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, [UIScreen mainScreen].scale);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

//生成纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    if (!color || CGSizeEqualToSize(size, CGSizeZero)) {
        return nil;
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

@end
