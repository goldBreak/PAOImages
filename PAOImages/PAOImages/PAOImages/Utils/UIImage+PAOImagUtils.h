//
//  UIImage+PAOImagUtils.h
//  PAOImage
//
//  Created by xsd on 2018/3/6.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PAOImagUtils)

/**
 是不是GIF图片

 @param data 图片数据
 @return bool
 */
+ (BOOL)isGifImage:(NSData *)data;

/**
 是不是GIF图片

 @param filePath 图片路径
 @return bool
 */
+ (BOOL)isGifImageByFilePath:(NSString *)filePath;


/**
 获取纯色图片

 @param color 颜色
 @param size 大小
 @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
