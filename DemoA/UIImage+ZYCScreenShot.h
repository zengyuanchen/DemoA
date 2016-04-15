//
//  UIImage+ZYCScreenShot.h
//  DemoA
//
//  Created by 曾源琛 on 16/4/15.
//  Copyright © 2016年 zengyuanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZYCScreenShot)

//获取指定rect区域的截图
- (UIImage *)imageFromRect:(CGRect)rect;
//截屏
+ (UIImage *)printScreenFromView:(UIView *)view;

//生成纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
