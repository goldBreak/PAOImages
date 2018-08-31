//
//  UIImage+PAOImageUtils.m
//  PAOImage
//
//  Created by xsd on 2018/3/6.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "UIImage+PAOImageUtils.h"
#import "CIImage+PAOImageUtils.h"

@implementation UIImage (PAOHandleImageUtils)

#pragma mark - 模糊模块
- (UIImage *)gaussianBlurWithRadious:(CGFloat)radious {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage gaussianBlurWithRadious:radious];
    
    return [outPutImage dealImage];
}

- (UIImage *)boxBlurWithRadious:(CGFloat)radious {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage boxBlurWithRadious:radious];
    return [outPutImage dealImage];
}

- (UIImage *)discBlurWithRadious:(CGFloat)radious {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage discBlurWithRadious:radious];
    return [outPutImage dealImage];
}

- (UIImage *)maskedVariableBlurWithImage:(UIImage *)maskImage andRadious:(CGFloat)radious {
    
    CIImage *ciimage = [self ciimage];
    CIImage *maskimage = [maskImage ciimage];
    
    CIImage *outPutImage = [ciimage maskedVariableBlurWithImage:maskimage andRadious:radious];
    return [outPutImage dealImage];
}

- (UIImage *)medianBlur {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage medianBlur];
    
    return [outPutImage dealImage];
}

- (UIImage *)motionBlurWithRadious:(CGFloat)radious andAngle:(CGFloat)angle {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage motionBlurWithRadious:radious andAngle:angle];
    
    return [outPutImage dealImage];
}

- (UIImage *)noiseReductionWithNoiseLevel:(CGFloat)noiseLevel andSharpness:(CGFloat)shaperness {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage noiseReductionWithNoiseLevel:noiseLevel andSharpness:shaperness];
    
    return [outPutImage dealImage];
}

- (UIImage *)zoomBlurWithCenter:(CGPoint)vector andInputAmount:(CGFloat)amount {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage zoomBlurWithCenter:vector andInputAmount:amount];
    
    return [outPutImage dealImage];
}
#pragma mark - 颜色修改模块
- (UIImage *)colorClampImageWithMinComponents:(float *)minColor andMaxComponents:(float *)maxColor {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage colorClampImageWithMinComponents:minColor andMaxComponents:maxColor];
    
    return [outPutImage dealImage];
}

- (UIImage *)colorControlsWithSaturation:(CGFloat)saturation andbrightness:(CGFloat)brightness andcontrast:(CGFloat)contrast {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage colorControlsWithSaturation:saturation andbrightness:brightness andcontrast:contrast];
    
    return [outPutImage dealImage];
}

- (UIImage *)colorMatrixWithRGBAVector:(float [4][4])RGBAVector andBiasVector:(float [4])biasVector {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage colorMatrixWithRGBAVector:RGBAVector andBiasVector:biasVector];
    
    return [outPutImage dealImage];
}

- (UIImage *)colorPolynomialWithRGBAVector:(float [4][4])RGBAVector {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage colorPolynomialWithRGBAVector:RGBAVector];
    
    return [outPutImage dealImage];
}

- (UIImage *)exposureWithEv:(float)inputEV {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage exposureWithEv:inputEV];
    
    return [outPutImage dealImage];
}

- (UIImage *)gammaAdjustWithPower:(float)power {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage gammaAdjustWithPower:power];
    
    return [outPutImage dealImage];
}

- (UIImage *)hueAdjustWithAngle:(float)angle {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage hueAdjustWithAngle:angle];
    
    return [outPutImage dealImage];
}

- (UIImage *)linearToSRGBtoneCurve {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage linearToSRGBtoneCurve];
    
    return [outPutImage dealImage];
}

- (UIImage *)SRGBToneCurveToLinear {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage SRGBToneCurveToLinear];
    
    return [outPutImage dealImage];
}

- (UIImage *)temperatureAndTintWithNeutral:(CGPoint)neural andTargetNeitral:(CGPoint)targetNeural {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage temperatureAndTintWithNeutral:neural andTargetNeitral:targetNeural];
    
    return [outPutImage dealImage];
}

- (UIImage *)toneCurveWithPoints:(float [5][2])points {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage toneCurveWithPoints:points];
    
    return [outPutImage dealImage];
}

- (UIImage *)vibranceWithAmount:(CGFloat)amount {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage vibranceWithAmount:amount];
    
    return [outPutImage dealImage];
}

- (UIImage *)whitePointAdjustWithColor:(UIColor *)color {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage whitePointAdjustWithColor:color];
    
    return [outPutImage dealImage];
}

#pragma mark - 图片合成效果
- (UIImage *)additionCompositingWithBgImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage additionCompositingWithBgImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)colorBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage colorBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)colorBurnBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage colorBurnBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)dodgeBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage dodgeBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)darkenBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage darkenBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)differenceBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage differenceBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)divideBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage divideBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)exclusionBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage exclusionBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)hardLightBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage hardLightBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)hueBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage hueBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)LightenBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage LightenBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)linearBurnBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage linearBurnBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

- (UIImage *)linearDodgeBlendModeWithBGImage:(UIImage *)bgImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage linearDodgeBlendModeWithBGImage:[bgImage ciimage]];
    
    return [outPutImage dealImage];
}

#pragma mark - CICategoryDistortionEffect  - 图形变化
- (UIImage *)bumpDistortionWithCenter:(CGPoint)center andRadous:(CGFloat)radious andScale:(CGFloat)scale {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage bumpDistortionWithCenter:center andRadous:radious andScale:scale];
    
    return [outPutImage dealImage];
}

- (UIImage *)circularWrapWithCenter:(CGPoint)center andRadous:(CGFloat)radious andAngle:(CGFloat)angle {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage circularWrapWithCenter:center andRadous:radious andAngle:angle];
    
    return [outPutImage dealImage];
}

- (UIImage *)displacementDistortionWithDisplacementImage:(UIImage *)displacementImage andInputScale:(CGFloat)scale {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage displacementDistortionWithDisplacementImage:[displacementImage ciimage] andInputScale:scale];
    
    return [outPutImage dealImage];
}

- (UIImage *)glassDistortionWithTextrure:(UIImage *)texture andCenter:(CGPoint)center andScale:(CGFloat)scale {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage glassDistortionWithTextrure:[texture ciimage] andCenter:center andScale:scale];
    
    return [outPutImage dealImage];
}

- (UIImage *)glassLozengeWithPoint0:(CGPoint)point0 andPoint1:(CGPoint)point1 andRadius:(CGFloat)radius andRefraction:(CGFloat)refraction {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage glassLozengeWithPoint0:point0 andPoint1:point1 andRadius:radius andRefraction:refraction];
    
    return [outPutImage dealImage];
}

- (UIImage *)holeDistortionWithInputCenter:(CGPoint)center andRadius:(CGFloat)radius {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage holeDistortionWithInputCenter:center andRadius:radius];
    
    return [outPutImage dealImage];
}

- (UIImage *)lightTunnelWithCenter:(CGPoint)center andRotation:(CGFloat)rotation andRadius:(CGFloat)radius {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage lightTunnelWithCenter:center andRotation:rotation andRadius:radius];
    
    return [outPutImage dealImage];
}

- (UIImage *)pinchDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andScale:(CGFloat)scale {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage pinchDistortionWithCenter:center andRadius:radius andScale:scale];
    
    return [outPutImage dealImage];
}

- (UIImage *)paintingWithColor:(UIColor *)color {
    
    UIImage *outPutImage = [self noirEffectImage];
    return [outPutImage whitePointAdjustWithColor:color];
}

- (UIImage *)torusLensDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andWith:(CGFloat)width andRefraction:(CGFloat)refraction {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage torusLensDistortionWithCenter:center andRadius:radius andWith:width andRefraction:refraction];
    
    return [outPutImage dealImage];
}

- (UIImage *)TwirDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andAngle:(CGFloat)angle {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage TwirDistortionWithCenter:center andRadius:radius andAngle:angle];
    
    return [outPutImage dealImage];
}

- (UIImage *)noirEffectImage {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage noirEffectImage];
    
    return [outPutImage dealImage];
}

- (UIImage *)edgedJudgeWithInstance:(CGFloat)inputIntensity {
    
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage edgedJudgeWithInstance:inputIntensity];
    
    return [outPutImage dealImage];
}

- (UIImage *)CILineOverlaySource {
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage CILineOverlaySource];
    
    return [outPutImage dealImage];
}

- (UIImage *)CIBumpDistortionLinearSource {
    CIImage *ciimage = [self ciimage];
    CIImage *outPutImage = [ciimage CIBumpDistortionLinearSource];
    
    return [outPutImage dealImage];
}
#pragma mark - 公共模块
- (CIImage *)ciimage {
    
    CIImage *returnImage = self.CIImage;
    if (nil == returnImage) {
        CGImageRef imageRef = self.CGImage;
        returnImage = [CIImage imageWithCGImage:imageRef];
    }
    return returnImage;
}

- (UIImage *)normalizedImage {
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

@end
