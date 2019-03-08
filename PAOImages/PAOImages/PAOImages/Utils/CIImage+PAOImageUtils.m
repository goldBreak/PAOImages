//
//  CIImage+PAOImageUtils.m
//  PAOImage
//
//  Created by xsd on 2018/3/6.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "CIImage+PAOImageUtils.h"

@implementation CIImage (PAOHandleImageUtils)

#pragma mark - 模糊模块
- (CIImage *)gaussianBlurWithRadious:(CGFloat)radious {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:@(radious) forKey:kCIInputRadiusKey];
    //    NSLog(@"%@",[filter attributes]);
    
    return filter.outputImage;
}

- (CIImage *)boxBlurWithRadious:(CGFloat)radious {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIBoxBlur"];
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:@(radious) forKey:kCIInputRadiusKey];
    
    return filter.outputImage;
}

- (CIImage *)discBlurWithRadious:(CGFloat)radious {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIDiscBlur"];
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:@(radious) forKey:kCIInputRadiusKey];
    
    return filter.outputImage;
}

- (CIImage *)maskedVariableBlurWithImage:(CIImage *)maskImage andRadious:(CGFloat)radious {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIMaskedVariableBlur"];
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:maskImage forKey:@"inputMask"];
    [filter setValue:@(radious) forKey:kCIInputRadiusKey];
    
    return filter.outputImage;
}

- (CIImage *)medianBlur {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIMedianFilter"];
    [filter setValue:self forKey:kCIInputImageKey];
    
    return filter.outputImage;
}

- (CIImage *)motionBlurWithRadious:(CGFloat)radious andAngle:(CGFloat)angle {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIMotionBlur"];
    
    NSLog(@"%@",filter.attributes);
    
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:@(radious) forKey:kCIInputRadiusKey];
    [filter setValue:@(angle) forKey:kCIInputAngleKey];
    
    return filter.outputImage;
}

- (CIImage *)noiseReductionWithNoiseLevel:(CGFloat)noiseLevel andSharpness:(CGFloat)shaperness {
    
    CIFilter *filter = [CIFilter filterWithName:@"CINoiseReduction"];
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:@(noiseLevel) forKey:@"inputNoiseLevel"];
    [filter setValue:@(shaperness) forKey:@"inputSharpness"];
    
    return filter.outputImage;
}

- (CIImage *)zoomBlurWithCenter:(CGPoint)vector andInputAmount:(CGFloat)amount {
    
    CIVector *civector = [[CIVector alloc] initWithCGPoint:vector];
    CIFilter *filter = [CIFilter filterWithName:@"CIZoomBlur"];
    
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:civector forKey:@"inputCenter"];
    [filter setValue:@(amount) forKey:@"inputAmount"];
    
    return filter.outputImage;
}

#pragma mark - 颜色修改模块
- (CIImage *)colorClampImageWithMinComponents:(float *)minColor andMaxComponents:(float *)maxColor {
    
    CIVector *minVector = [[CIVector alloc] initWithX:minColor[0] Y:minColor[1] Z:minColor[2] W:minColor[3]];
    CIVector *maxVector = [[CIVector alloc] initWithX:maxColor[0] Y:maxColor[1] Z:maxColor[2] W:maxColor[3]];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorClamp"];
    NSLog(@"%@",[filter attributes]);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:minVector forKey:@"inputMinComponents"];
    [filter setValue:maxVector forKey:@"inputMaxComponents"];
    
    return filter.outputImage;
}

- (CIImage *)colorControlsWithSaturation:(CGFloat)saturation andbrightness:(CGFloat)brightness andcontrast:(CGFloat)contrast {
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
    NSLog(@"%@",[filter attributes]);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:@(saturation) forKey:@"inputSaturation"];
    [filter setValue:@(brightness) forKey:@"inputBrightness"];
    [filter setValue:@(contrast) forKey:@"inputContrast"];
    
    return filter.outputImage;
}

- (CIImage *)colorMatrixWithRGBAVector:(float [4][4])RGBAVector andBiasVector:(float [4])biasVector {
    
    CIVector *rVector = [[CIVector alloc] initWithX:RGBAVector[0][0] Y:RGBAVector[0][1] Z:RGBAVector[0][2] W:RGBAVector[0][3]];
    CIVector *gVector = [[CIVector alloc] initWithX:RGBAVector[1][0] Y:RGBAVector[1][1] Z:RGBAVector[1][2] W:RGBAVector[1][3]];
    CIVector *bVector = [[CIVector alloc] initWithX:RGBAVector[2][0] Y:RGBAVector[2][1] Z:RGBAVector[2][2] W:RGBAVector[2][3]];
    CIVector *aVector = [[CIVector alloc] initWithX:RGBAVector[3][0] Y:RGBAVector[3][1] Z:RGBAVector[3][2] W:RGBAVector[3][3]];
    CIVector *bisaVector = [[CIVector alloc] initWithX:biasVector[0] Y:biasVector[1] Z:biasVector[2] W:biasVector[3]];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorMatrix"];
    NSLog(@"%@",[filter attributes]);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:rVector forKey:@"inputRVector"];
    [filter setValue:gVector forKey:@"inputGVector"];
    [filter setValue:bVector forKey:@"inputBVector"];
    [filter setValue:aVector forKey:@"inputAVector"];
    [filter setValue:bisaVector forKey:@"inputBiasVector"];
    
    return filter.outputImage;
}

- (CIImage *)colorPolynomialWithRGBAVector:(float [4][4])RGBAVector {
    
    CIVector *rVector = [[CIVector alloc] initWithX:RGBAVector[0][0] Y:RGBAVector[0][1] Z:RGBAVector[0][2] W:RGBAVector[0][3]];
    CIVector *gVector = [[CIVector alloc] initWithX:RGBAVector[1][0] Y:RGBAVector[1][1] Z:RGBAVector[1][2] W:RGBAVector[1][3]];
    CIVector *bVector = [[CIVector alloc] initWithX:RGBAVector[2][0] Y:RGBAVector[2][1] Z:RGBAVector[2][2] W:RGBAVector[2][3]];
    CIVector *aVector = [[CIVector alloc] initWithX:RGBAVector[3][0] Y:RGBAVector[3][1] Z:RGBAVector[3][2] W:RGBAVector[3][3]];
    
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorPolynomial"];
    NSLog(@"%@",[filter attributes]);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:rVector forKey:@"inputRedCoefficients"];
    [filter setValue:gVector forKey:@"inputGreenCoefficients"];
    [filter setValue:bVector forKey:@"inputBlueCoefficients"];
    [filter setValue:aVector forKey:@"inputAlphaCoefficients"];
    
    return filter.outputImage;
}

- (CIImage *)exposureWithEv:(float)inputEV {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIExposureAdjust"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:@(inputEV) forKey:@"inputEV"];
    
    return filter.outputImage;
}

- (CIImage *)gammaAdjustWithPower:(float)power {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGammaAdjust"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:@(power) forKey:@"inputPower"];
    
    return filter.outputImage;
}

- (CIImage *)hueAdjustWithAngle:(float)angle {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIHueAdjust"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:@(angle) forKey:@"inputAngle"];
    
    return filter.outputImage;
}

- (CIImage *)linearToSRGBtoneCurve {
    
    CIFilter *filter = [CIFilter filterWithName:@"CILinearToSRGBToneCurve"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    return filter.outputImage;
}

- (CIImage *)SRGBToneCurveToLinear {
    
    CIFilter *filter = [CIFilter filterWithName:@"CISRGBToneCurveToLinear"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    return filter.outputImage;
}

- (CIImage *)temperatureAndTintWithNeutral:(CGPoint)neural andTargetNeitral:(CGPoint)targetNeural {
    
    CIVector *neuralVector = [[CIVector alloc] initWithX:neural.x Y:neural.y];
    CIVector *targetNeuralVector = [[CIVector alloc] initWithX:targetNeural.x Y:targetNeural.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CITemperatureAndTint"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:neuralVector forKey:@"inputNeutral"];
    [filter setValue:targetNeuralVector forKey:@"inputTargetNeutral"];
    
    return filter.outputImage;
}

- (CIImage *)toneCurveWithPoints:(float [5][2])points {
    
    CIVector *point0Vector = [[CIVector alloc] initWithX:points[0][0] Y:points[0][1]];
    CIVector *point1Vector = [[CIVector alloc] initWithX:points[1][0] Y:points[1][1]];
    CIVector *point2Vector = [[CIVector alloc] initWithX:points[2][0] Y:points[2][1]];
    CIVector *point3Vector = [[CIVector alloc] initWithX:points[3][0] Y:points[3][1]];
    CIVector *point4Vector = [[CIVector alloc] initWithX:points[4][0] Y:points[4][1]];
    
    
    CIFilter *filter = [CIFilter filterWithName:@"CIToneCurve"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:point0Vector forKey:@"inputPoint0"];
    [filter setValue:point1Vector forKey:@"inputPoint1"];
    [filter setValue:point2Vector forKey:@"inputPoint2"];
    [filter setValue:point3Vector forKey:@"inputPoint3"];
    [filter setValue:point4Vector forKey:@"inputPoint4"];
    
    return filter.outputImage;
}

- (CIImage *)vibranceWithAmount:(CGFloat)amount {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIVibrance"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:@(amount) forKey:@"inputAmount"];
    
    return filter.outputImage;
}

- (CIImage *)whitePointAdjustWithColor:(UIColor *)color {
    
    CIColor *cicolor = [CIColor colorWithCGColor:color.CGColor];
    CIFilter *filter = [CIFilter filterWithName:@"CIWhitePointAdjust"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:cicolor forKey:@"inputColor"];
    
    return filter.outputImage;
}

#pragma mark - 图片合成效果
- (CIImage *)additionCompositingWithBgImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIAdditionCompositing"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)colorBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)colorBurnBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorBurnBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)dodgeBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorDodgeBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)darkenBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIDarkenBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)differenceBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIDifferenceBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)divideBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIDivideBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)exclusionBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIExclusionBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)hardLightBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIHardLightBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)hueBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIHueBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)LightenBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CILightenBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)linearBurnBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CILinearBurnBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

- (CIImage *)linearDodgeBlendModeWithBGImage:(CIImage *)bgImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CILinearDodgeBlendMode"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:bgImage forKey:kCIInputBackgroundImageKey];
    
    return filter.outputImage;
}

#pragma mark - CICategoryDistortionEffect  - 图形变化
- (CIImage *)bumpDistortionWithCenter:(CGPoint)center andRadous:(CGFloat)radious andScale:(CGFloat)scale {
    
    CIVector *centerVector = [[CIVector alloc] initWithX:center.x Y:center.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIBumpDistortion"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:centerVector forKey:@"inputCenter"];
    [filter setValue:@(radious) forKey:@"inputRadius"];
    [filter setValue:@(scale) forKey:@"inputScale"];
    
    return filter.outputImage;
}

- (CIImage *)circularWrapWithCenter:(CGPoint)center andRadous:(CGFloat)radious andAngle:(CGFloat)angle {
    
    CIVector *centerVector = [[CIVector alloc] initWithX:center.x Y:center.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CICircularWrap"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:centerVector forKey:@"inputCenter"];
    [filter setValue:@(radious) forKey:@"inputRadius"];
    [filter setValue:@(angle) forKey:@"inputAngle"];
    
    return filter.outputImage;
}

- (CIImage *)displacementDistortionWithDisplacementImage:(CIImage *)displacementImage andInputScale:(CGFloat)scale {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIDisplacementDistortion"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:displacementImage forKey:@"inputDisplacementImage"];
    [filter setValue:@(scale) forKey:kCIInputScaleKey];
    
    return filter.outputImage;
}

- (CIImage *)glassDistortionWithTextrure:(CIImage *)texture andCenter:(CGPoint)center andScale:(CGFloat)scale {
    
    CIVector *centerVector = [[CIVector alloc] initWithX:center.x Y:center.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGlassDistortion"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:centerVector forKey:kCIInputCenterKey];
    [filter setValue:texture forKey:@"inputTexture"];
    [filter setValue:@(scale) forKey:@"inputScale"];
    
    return filter.outputImage;
}

- (CIImage *)glassLozengeWithPoint0:(CGPoint)point0 andPoint1:(CGPoint)point1 andRadius:(CGFloat)radius andRefraction:(CGFloat)refraction {
    
    CIVector *vector0 = [[CIVector alloc] initWithX:point0.x Y:point0.y];
    CIVector *vector1 = [[CIVector alloc] initWithX:point1.x Y:point1.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGlassLozenge"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:vector0 forKey:@"inputPoint0"];
    [filter setValue:vector1 forKey:@"inputPoint1"];
    [filter setValue:@(radius) forKey:@"inputRadius"];
    [filter setValue:@(refraction) forKey:@"inputRefraction"];
    
    return filter.outputImage;
}

- (CIImage *)holeDistortionWithInputCenter:(CGPoint)center andRadius:(CGFloat)radius {
    
    CIVector *centerVector = [[CIVector alloc] initWithX:center.x Y:center.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIHoleDistortion"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:centerVector forKey:kCIInputCenterKey];
    [filter setValue:@(radius) forKey:@"inputRadius"];
    
    return filter.outputImage;
}

- (CIImage *)lightTunnelWithCenter:(CGPoint)center andRotation:(CGFloat)rotation andRadius:(CGFloat)radius {
    
    CIVector *centerVector = [[CIVector alloc] initWithX:center.x Y:center.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CILightTunnel"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:centerVector forKey:@"inputCenter"];
    [filter setValue:@(radius) forKey:@"inputRadius"];
    [filter setValue:@(rotation) forKey:@"inputRotation"];
    
    return filter.outputImage;
}

- (CIImage *)pinchDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andScale:(CGFloat)scale {
    
    CIVector *centerVector = [[CIVector alloc] initWithX:center.x Y:center.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIPinchDistortion"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:centerVector forKey:@"inputCenter"];
    [filter setValue:@(radius) forKey:@"inputRadius"];
    [filter setValue:@(scale) forKey:@"inputScale"];
    
    return filter.outputImage;
}

- (CIImage *)torusLensDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andWith:(CGFloat)width andRefraction:(CGFloat)refraction {
    
    CIVector *centerVector = [[CIVector alloc] initWithX:center.x Y:center.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CITorusLensDistortion"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:centerVector forKey:@"inputCenter"];
    [filter setValue:@(radius) forKey:@"inputRadius"];
    [filter setValue:@(refraction) forKey:@"inputRefraction"];
    [filter setValue:@(width) forKey:@"inputWidth"];
    
    return filter.outputImage;
}

- (CIImage *)TwirDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andAngle:(CGFloat)angle {
    
    CIVector *centerVector = [[CIVector alloc] initWithX:center.x Y:center.y];
    
    CIFilter *filter = [CIFilter filterWithName:@"CITwirlDistortion"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:centerVector forKey:@"inputCenter"];
    [filter setValue:@(radius) forKey:@"inputRadius"];
    [filter setValue:@(angle) forKey:@"inputAngle"];
    
    return filter.outputImage;
}

// 黑白色
- (CIImage *)noirEffectImage {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectNoir"];
    //    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    
    return filter.outputImage;
}

- (CIImage *)edgedJudgeWithInstance:(CGFloat)inputIntensity {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIEdges"];
    NSLog(@"%@",filter.attributes);
    [filter setValue:self forKey:kCIInputImageKey];
    [filter setValue:@(inputIntensity) forKey:@"inputIntensity"];
    
    return filter.outputImage;
}

- (CIImage *)CILineOverlaySource {
    
    CIFilter *filter = [CIFilter filterWithName:@"CILineOverlay"];
    [filter setValue:self forKey:kCIInputImageKey];
    NSLog(@"%@",filter.attributes);
    
    return filter.outputImage;
}

- (CIImage *)CIBumpDistortionLinearSource {
    
    CIVector *centerVector = [[CIVector alloc] initWithX:self.extent.size.width/2. Y:self.extent.size.height/2.0];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIBumpDistortionLinear"];
    [filter setValue:self forKey:kCIInputImageKey];
    NSLog(@"%@",filter.attributes);
    [filter setValue:centerVector forKey:kCIInputCenterKey];
    [filter setValue:@2.5 forKey:kCIInputAngleKey];
    [filter setValue:@400 forKey:kCIInputRadiusKey];
    [filter setValue:@0.6 forKey:kCIInputScaleKey];
    return filter.outputImage;
}


- (CIImage *)CICategoryColorEffect {
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorCrossPolynomial"];
    
    NSLog(@"%@",filter.attributes);
    
    const CGFloat red[] = {0.0,0.3,0.3,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
    CIVector *redVect = [CIVector vectorWithValues:red count:10];
    
    const CGFloat blue[] = {0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
    CIVector *blueVect = [CIVector vectorWithValues:blue count:10];
    
    const CGFloat green[] = {0.0,0.0,0.0,0.0,0.5,0.0,0.0,0.0,0.5,0.0};
    CIVector *greenVect = [CIVector vectorWithValues:green count:10];
    
    [filter setValue:self forKey:kCIInputImageKey];
    
    [filter setValue:redVect forKey:@"inputRedCoefficients"];
    
//    [filter setValue:blueVect forKey:@"inputBlueCoefficients"];
    
//    [filter setValue:greenVect forKey:@"inputGreenCoefficients"];
    
    return filter.outputImage;
}

#pragma mark - 公共模块
- (UIImage *)dealImage {
    
//        UIImage *image = [UIImage imageWithCIImage:self];// scale:0.5 orientation:UIImageOrientationUp
//        return image;
    
    CIContext *content = [CIContext contextWithOptions:nil];;
    CGImageRef ref = [content createCGImage:self fromRect:self.extent];
//
    return  [UIImage imageWithCGImage:ref];
}
@end
