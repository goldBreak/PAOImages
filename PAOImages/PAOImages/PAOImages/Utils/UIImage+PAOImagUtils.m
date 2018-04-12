//
//  UIImage+PAOImagUtils.m
//  PAOImage
//
//  Created by xsd on 2018/3/6.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "UIImage+PAOImagUtils.h"

@implementation UIImage (PAOImagUtils)

+ (BOOL)isGifImage:(NSData *)data {
    if (!data) {
        return NO;
    }
    if (data.length < 16) {
        return NO;
    }
    UInt32 dataBytes = *(UInt32 *)data.bytes;
    
    if ((dataBytes & 0xFFFFFF) != '\0FIG') {
        return NO;
    }
    
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFTypeRef)data, NULL);
    if (!source) {
        return NO;
    }
    //最终判断的是gif的图片源的数量
    size_t count = CGImageSourceGetCount(source);
    
    return count > 1;
}

+ (BOOL)isGifImageByFilePath:(NSString *)filePath {
    
    if (!filePath) {
        return NO;
    }
    
    FILE *filePoint = fopen(filePath.UTF8String, "rb");
    
    if (!filePoint) {
        return NO;
    }
    
    BOOL isGif = NO;
    
    UInt32 dataBytes = 0;
    
    if (fread(&dataBytes, sizeof(UInt32), 1, filePoint)) {
        if ((dataBytes & 0xFFFFFF) == '\0FIG') {
            isGif = YES;
        }
    }
    
    return isGif;
}
@end
