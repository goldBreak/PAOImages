//
//  CIImage+PAOImageUtils.h
//  PAOImage
//
//  Created by xsd on 2018/3/6.
//  Copyright © 2018年 com.GF. All rights reserved.
//
//
//  官网滤镜
//  https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/uid/TP30000136-SW29
//

#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>

@interface CIImage (PAOHandleImageUtils)

#pragma mark - 模糊模块
/**
 *  @author Gaof, 16-07-20 14:07:20
 *
 *  高斯模糊处理
 *
 *  @param radious 模糊半径
 *
 *  @return ciimage
 */
- (CIImage *)gaussianBlurWithRadious:(CGFloat)radious;

/**
 *  @author Gaof, 16-07-20 15:07:48
 *
 *  均值模糊处理
 *
 *  @param radious 模糊半径
 *
 *  @return ciimage
 */
- (CIImage *)boxBlurWithRadious:(CGFloat)radious;

/**
 *  @author Gaof, 16-07-20 15:07:49
 *
 *  圆盘内模糊
 *
 *  @param radious 模糊半径
 *
 *  @return ciimage
 */
- (CIImage *)discBlurWithRadious:(CGFloat)radious;

/**
 *  @author Gaof, 16-07-20 15:07:40
 *
 *  浮层图片模糊
 *
 *  @param maskImage 浮层图片
 *  @param radious   半径 取值范围为0~100  100的时候效果最明显
 *  ps（想不通的是，为啥打印出来的attributes max是10.官方文档上面是100,而且100是对的！！！）
 *  @return ciimage
 */
- (CIImage *)maskedVariableBlurWithImage:(CIImage *)maskImage andRadious:(CGFloat)radious;

/**
 *  @author Gaof, 16-07-20 16:07:28
 *
 *  median模糊
 *
 *  @return ciimage
 */
- (CIImage *)medianBlur;

/**
 *  @author Gaof, 16-07-20 16:07:56
 *
 *  动态模糊
 *
 *  @param radious 模糊半径 最大是100，默认是20，最小0
 *  @param angle   模糊角度 0 ~ 2 * M_PI
 *
 *  @return ciimage
 */
- (CIImage *)motionBlurWithRadious:(CGFloat)radious andAngle:(CGFloat)angle;


/**
 *  @author Gaof, 16-07-20 17:07:41
 *
 *  噪音减少
 *
 *  @param noiseLevel 噪音等级 max 0.1
 *  @param shaperness 锐度 max 2
 *
 *  @return ciimage
 */
- (CIImage *)noiseReductionWithNoiseLevel:(CGFloat)noiseLevel andSharpness:(CGFloat)shaperness;


/**
 *  @author Gaof, 16-07-20 17:07:22
 *
 *  快速移动带来的模糊
 *
 *  @param vector 矢量
 *  @param amount 深度
 *  PS:::::左下角是坐标原点
 *  @return ciimage
 */
- (CIImage *)zoomBlurWithCenter:(CGPoint)vector andInputAmount:(CGFloat)amount;

#pragma mark - 颜色修改模块
/**
 *  @author Gaof, 16-07-21 10:07:04
 *
 *  设置每一个像素点的最大最小 颜色值
 *
 *  @param minColor (RGBA) 最小的颜色饱和度
 *  @param maxColor (RGBA) 最大的颜色饱和度
 *
 *  @return ciimage
 */
- (CIImage *)colorClampImageWithMinComponents:(float *)minColor andMaxComponents:(float *)maxColor;

/**
 *  @author Gaof, 16-07-21 11:07:39
 *
 *  颜色控制，调节 饱和度、亮度和对比度三项
 *
 *  @param saturation 饱和度
 *  @param brightness 亮度
 *  @param contrast   对比度
 *
 *  (color.rgb - vec3(0.5)) * contrast + vec3(0.5)
 *  color.rgb + vec3(brightness)
 *  @return ciimage
 */
- (CIImage *)colorControlsWithSaturation:(CGFloat)saturation andbrightness:(CGFloat)brightness andcontrast:(CGFloat)contrast;

/**
 *  @author Gaof, 16-07-21 14:07:34
 *
 *  矩阵颜色
 *
 *  @param RGBAVector int [4][4]的一个C语言数组
 *  @param biasVector int[4]的一个数组
 *
 *  @return ciimage
 */
- (CIImage *)colorMatrixWithRGBAVector:(float [4][4])RGBAVector andBiasVector:(float [4])biasVector;

/**
 *  @author Gaof, 16-07-21 14:07:59
 *
 *  多项式颜色修改
 *
 *  @param RGBAVector float[4][4]
 *
 *  @return ciimage
 */
- (CIImage *)colorPolynomialWithRGBAVector:(float [4][4])RGBAVector;

/**
 *  @author Gaof, 16-07-21 15:07:56
 *
 *  曝光调节
 *
 *  @param inputEV °
 *
 *  @return ciimage
 */
- (CIImage *)exposureWithEv:(float)inputEV;

/**
 *  @author Gaof, 16-07-21 15:07:17
 *
 *  ∂校准
 *
 *  @param power 校准° 0.25 ~ 4
 *
 *  @return ciimage
 */
- (CIImage *)gammaAdjustWithPower:(float)power;

/**
 *  @author Gaof, 16-07-21 16:07:44
 *
 *  色调校准
 *
 *  @param angle -M_PI ~ M_PI
 *
 *  @return ciimage
 */
- (CIImage *)hueAdjustWithAngle:(float)angle;

/**
 *  @author Gaof, 16-07-21 16:07:58
 *
 *  从线性色彩转到曲线色彩空间
 *
 *  @return ciimage
 */
- (CIImage *)linearToSRGBtoneCurve;

/**
 *  @author Gaof, 16-07-21 16:07:58
 *
 *  曲线色彩空间到从线性色彩转
 *
 *  @return ciimage
 */
- (CIImage *)SRGBToneCurveToLinear;

/**
 *  @author Gaof, 16-07-21 16:07:53
 *
 *  温度色彩调整
 *
 *  @param neural       原始的
 *  @param targetNeural 目标
 *
 *  @return ciimage
 */
- (CIImage *)temperatureAndTintWithNeutral:(CGPoint)neural andTargetNeitral:(CGPoint)targetNeural;

/**
 *  @author Gaof, 16-07-21 17:07:17
 *
 *  曲线色彩模块
 *
 *  @param points float[2][5]
 *
 *  @return ciimage
 */
- (CIImage *)toneCurveWithPoints:(float [5][2])points;

/**
 *  @author Gaof, 16-07-21 17:07:35
 *
 *  振动
 *
 *  @param amount 振幅 -1 ~ 1
 *
 *  @return ciimage
 */
- (CIImage *)vibranceWithAmount:(CGFloat)amount;

/**
 *  @author Gaof, 16-07-22 13:07:06
 *
 *  将白色替换成输入颜色
 *
 *  @param color 目标颜色
 *
 *  @return ciimage
 */
- (CIImage *)whitePointAdjustWithColor:(UIColor *)color;

#pragma mark - 图片合成效果
/**
 *  @author Gaof, 16-07-22 14:07:56
 *
 *  正态叠加
 *
 *  @param bgImage 背景图片
 *
 *  @return ciimage
 */
- (CIImage *)additionCompositingWithBgImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 14:07:37
 *
 *  颜色混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return ciimage
 */
- (CIImage *)colorBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 15:07:37
 *
 *  Darkens the background image samples to reflect the source image samples.
 *  感觉就像图片的差分
 *
 *  @param bgImage 背景图片
 *
 *  @return ciimage
 */
- (CIImage *)colorBurnBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 15:07:52
 *
 *  颜色减淡混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return ciimage
 */
- (CIImage *)dodgeBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:34
 *
 *  变黑混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return ciimage
 */
- (CIImage *)darkenBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:58
 *
 *  差分混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return ciimage
 */
- (CIImage *)differenceBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:07
 *
 *  ➗？？？感觉这个才是差分混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return ciimage
 */
- (CIImage *)divideBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:29
 *
 *  排除混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return ciimage
 */
- (CIImage *)exclusionBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:29
 *
 *  硬光混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return ciimage
 */
- (CIImage *)hardLightBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:39
 *
 *  色彩混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return ciimage
 */
- (CIImage *)hueBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-25 10:07:32
 *
 *  减轻混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return ciimage
 */
- (CIImage *)LightenBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-25 10:07:15
 *
 *  线性燃烧混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return ciimage
 */
- (CIImage *)linearBurnBlendModeWithBGImage:(CIImage *)bgImage;

/**
 *  @author Gaof, 16-07-25 10:07:47
 *
 *  线性减轻混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return ciimage
 */
- (CIImage *)linearDodgeBlendModeWithBGImage:(CIImage *)bgImage;

#pragma mark - CICategoryDistortionEffect  - 图形变化
/**
 *  @author Gaof, 16-07-25 11:07:08
 *
 *  肿起模式变换
 *
 *  @param center  中心点
 *  @param radious 半径
 *  @param scale   缩放
 *
 *  @return ciimage
 */
- (CIImage *)bumpDistortionWithCenter:(CGPoint)center andRadous:(CGFloat)radious andScale:(CGFloat)scale;

/**
 *  @author Gaof, 16-07-25 14:07:17
 *
 *  循环包起来
 *
 *  @param center  中心点
 *  @param radious 半径
 *  @param angle   角度
 *
 *  @return ciimage
 */
- (CIImage *)circularWrapWithCenter:(CGPoint)center andRadous:(CGFloat)radious andAngle:(CGFloat)angle;

/**
 *  @author Gaof, 16-07-25 14:07:59
 *
 *  替换变形
 *
 *  @param displacementImage 替代的图片
 *  @param scale             输入形变度
 *
 *  @return ciimage
 */
- (CIImage *)displacementDistortionWithDisplacementImage:(CIImage *)displacementImage andInputScale:(CGFloat)scale;

/**
 *  @author Gaof, 16-07-25 14:07:53
 *
 *  玻璃形变
 *
 *  @param texture 纹理图片
 *  @param center  中心点
 *  @param scale 缩放
 *
 *  @return ciimage
 */
- (CIImage *)glassDistortionWithTextrure:(CIImage *)texture andCenter:(CGPoint)center andScale:(CGFloat)scale;

/**
 *  @author Gaof, 16-07-25 14:07:47
 *
 *  菱形形变
 *
 *  @param point0     default [150,150]
 *  @param point1     default [350,350]
 *  @param radius     distince default 100
 *  @param refraction scalar default 1.7
 *
 *  @return ciimage
 */
- (CIImage *)glassLozengeWithPoint0:(CGPoint)point0 andPoint1:(CGPoint)point1 andRadius:(CGFloat)radius andRefraction:(CGFloat)refraction;

/**
 *  @author Gaof, 16-07-25 16:07:48
 *
 *  黑洞污染
 *
 *  @param center 黑洞中心
 *  @param radius 半径
 *
 *  @return ciimage
 */
- (CIImage *)holeDistortionWithInputCenter:(CGPoint)center andRadius:(CGFloat)radius;

/**
 *  @author Gaof, 16-07-25 16:07:48
 *
 *  光的隧道？？？
 *
 *  @param center   中心点
 *  @param rotation 角度
 *  @param radius   半径
 *
 *  @return ciimage
 */
- (CIImage *)lightTunnelWithCenter:(CGPoint)center andRotation:(CGFloat)rotation andRadius:(CGFloat)radius;

/**
 *  @author Gaof, 16-07-25 17:07:48
 *
 *  捏合变形
 *
 *  @param center 中心点
 *  @param radius 半径
 *  @param scale  伸缩
 *
 *  @return ciimage
 */
- (CIImage *)pinchDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andScale:(CGFloat)scale;

/**
 *  @author Gaof, 16-07-25 17:07:03
 *
 *  镜头圆环形变
 *
 *  @param center     中心点
 *  @param radius     半径
 *  @param width      宽度
 *  @param refraction 形变量
 *
 *  @return ciimage
 */
- (CIImage *)torusLensDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andWith:(CGFloat)width andRefraction:(CGFloat)refraction;

/**
 *  @author Gaof, 16-07-26 10:07:06
 *
 *  扭曲形变
 *
 *  @param center 中心点
 *  @param radius 半径
 *  @param angle  角度
 *
 *  @return ciimage
 */
- (CIImage *)TwirDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andAngle:(CGFloat)angle;
/**
 *  @author Gaof, 16-07-25 15:07:39
 *
 *  黑白色图片
 *
 *  @return ciimage
 */
- (CIImage *)noirEffectImage;


- (CIImage *)CILineOverlaySource;


- (CIImage *)CIBumpDistortionLinearSource;

- (CIImage *)edgedJudgeWithInstance:(CGFloat)inputIntensity;

/**
 *  @author Gaof, 2019-03-08
 *
 *  交叉颜色混合
 *
 *  @return ciimage
 */
- (CIImage *)CICategoryColorEffect;
#pragma mark - 公共模块
/**
 *  @author Gaof, 16-07-20 15:07:25
 *
 *  转换成UIImage
 *
 *  @return UIImage
 */
- (UIImage *)dealImage;
@end
