//
//  UIImage+PAOImageUtils.h
//  PAOImage
//
//  Created by xsd on 2018/3/6.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PAOHandleImageUtils)

#pragma mark - 模糊模块
/**
 *  @author Gaof, 16-07-20 14:07:20
 *
 *  高斯模糊处理
 *
 *  @param radious 模糊半径
 *
 *  @return UIImage
 */
- (UIImage *)gaussianBlurWithRadious:(CGFloat)radious;

/**
 *  @author Gaof, 16-07-20 15:07:48
 *
 *  均值模糊处理
 *
 *  @param radious 模糊半径
 *
 *  @return UIImage
 */
- (UIImage *)boxBlurWithRadious:(CGFloat)radious;

/**
 *  @author Gaof, 16-07-20 15:07:49
 *
 *  圆盘内模糊
 *
 *  @param radious 模糊半径
 *
 *  @return UIImage
 */
- (UIImage *)discBlurWithRadious:(CGFloat)radious;

/**
 *  @author Gaof, 16-07-20 15:07:40
 *
 *  浮层图片模糊
 *
 *  @param maskImage 浮层图片
 *  @param radious   半径
 *
 *  @return UIImage
 */
- (UIImage *)maskedVariableBlurWithImage:(UIImage *)maskImage andRadious:(CGFloat)radious;

/**
 *  @author Gaof, 16-07-20 16:07:28
 *
 *  median模糊
 *
 *  @return UIImage
 */
- (UIImage *)medianBlur;

/**
 *  @author Gaof, 16-07-20 16:07:56
 *
 *  动态模糊
 *
 *  @param radious 模糊半径
 *  @param angle   模糊角度
 *
 *  @return UIImage
 */
- (UIImage *)motionBlurWithRadious:(CGFloat)radious andAngle:(CGFloat)angle;

/**
 *  @author Gaof, 16-07-20 17:07:41
 *
 *  噪音减少
 *
 *  @param noiseLevel 噪音等级
 *  @param shaperness 锐度
 *
 *  @return UIImage
 */
- (UIImage *)noiseReductionWithNoiseLevel:(CGFloat)noiseLevel andSharpness:(CGFloat)shaperness;

/**
 *  @author Gaof, 16-07-20 17:07:22
 *
 *  快速移动带来的模糊
 *
 *  @param vector 矢量
 *  @param amount 深度 max = 200
 *  PS:::::左下角是坐标原点
 *  @return UIImage
 */
- (UIImage *)zoomBlurWithCenter:(CGPoint)vector andInputAmount:(CGFloat)amount;

#pragma mark - 颜色修改模块
/**
 *  @author Gaof, 16-07-21 10:07:04
 *
 *  设置每一个像素点的最大最小 颜色值
 *
 *  @param minColor (RGBA) 最小的颜色饱和度
 *  @param maxColor (RGBA) 最大的颜色饱和度
 *
 *  @return UIImage
 */
- (UIImage *)colorClampImageWithMinComponents:(float *)minColor andMaxComponents:(float *)maxColor;

/**
 *  @author Gaof, 16-07-21 11:07:39
 *
 *  颜色控制，调节 饱和度、亮度和对比度三项
 *
 *  @param saturation 饱和度 max:2 min:0
 *  @param brightness 亮度  max:1 min:-1
 *  @param contrast   对比度 max:4 min:0.25
 *
 *  (color.rgb - vec3(0.5)) * contrast + vec3(0.5)
 *  color.rgb + vec3(brightness)
 *  @return UIImage
 */
- (UIImage *)colorControlsWithSaturation:(CGFloat)saturation andbrightness:(CGFloat)brightness andcontrast:(CGFloat)contrast;

/**
 *  @author Gaof, 16-07-21 14:07:34
 *
 *  矩阵颜色
 *
 *  @param RGBAVector int [4][4]的一个C语言数组
 *  @param biasVector int[4]的一个数组
 *
 *  s.r = dot(s, redVector)
 *  s.g = dot(s, greenVector)
 *  s.b = dot(s, blueVector)
 *  s.a = dot(s, alphaVector)
 *  s = s + bias
 *
 *  @return UIImage
 */
- (UIImage *)colorMatrixWithRGBAVector:(float [4][4])RGBAVector andBiasVector:(float [4])biasVector;

/**
 *  @author Gaof, 16-07-21 14:07:59
 *
 *  多项式颜色修改
 *
 *  @param RGBAVector float[4][4]
 *
 *  @return UIImage
 */
- (UIImage *)colorPolynomialWithRGBAVector:(float [4][4])RGBAVector;


/**
 *  @author Gaof, 16-07-21 15:07:56
 *
 *  曝光调节
 *
 *  @param inputEV ° -10 ~ 10 define 0
 *
 *  @return UIImage
 */
- (UIImage *)exposureWithEv:(float)inputEV;


/**
 *  @author Gaof, 16-07-21 15:07:17
 *
 *  ∂校准
 *
 *  @param power 校准° 0.25 ~ 4
 *
 *  @return UIImage
 */
- (UIImage *)gammaAdjustWithPower:(float)power;

/**
 *  @author Gaof, 16-07-21 16:07:44
 *
 *  色调校准
 *
 *  @param angle -M_PI ~ M_PI
 *
 *  @return UIImage
 */
- (UIImage *)hueAdjustWithAngle:(float)angle;

/**
 *  @author Gaof, 16-07-21 16:07:58
 *
 *  从线性色彩转到曲线色彩空间
 *
 *  @return UIImage
 */
- (UIImage *)linearToSRGBtoneCurve;

/**
 *  @author Gaof, 16-07-21 16:07:58
 *
 *  曲线色彩空间到从线性色彩转
 *
 *  @return UIImage
 */
- (UIImage *)SRGBToneCurveToLinear;


/**
 *  @author Gaof, 16-07-21 16:07:53
 *
 *  温度色彩调整
 *
 *  @param neural       原始的
 *  @param targetNeural 目标
 *
 *  @return UIImage
 */
- (UIImage *)temperatureAndTintWithNeutral:(CGPoint)neural andTargetNeitral:(CGPoint)targetNeural;

/**
 *  @author Gaof, 16-07-21 17:07:17
 *
 *  曲线色彩模块
 *
 *  @param points float[2][5]
 *
 *  @return UIImage
 */
- (UIImage *)toneCurveWithPoints:(float [5][2])points;

/**
 *  @author Gaof, 16-07-21 17:07:35
 *
 *  振动
 *
 *  @param amount 振幅 -1 ~ 1
 *
 *  @return UIImage
 */
- (UIImage *)vibranceWithAmount:(CGFloat)amount;

/**
 *  @author Gaof, 16-07-22 13:07:06
 *
 *  将白色替换成输入颜色
 *
 *  @param color 目标颜色
 *
 *  @return UIImage
 */
- (UIImage *)whitePointAdjustWithColor:(UIColor *)color;

#pragma mark - 图片合成效果
/**
 *  @author Gaof, 16-07-22 14:07:56
 *
 *  正片叠底
 *
 *  @param bgImage 背景图片
 *
 *  @return UIImage
 */
- (UIImage *)additionCompositingWithBgImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 14:07:37
 *
 *  颜色混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return UIImage
 */
- (UIImage *)colorBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 15:07:37
 *
 *  Darkens the background image samples to reflect the source image samples.
 *  感觉就像图片的差分
 *
 *  @param bgImage 背景图片
 *
 *  @return UIImage
 */
- (UIImage *)colorBurnBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 15:07:52
 *
 *  颜色减淡混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return UIImage
 */
- (UIImage *)dodgeBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:34
 *
 *  变黑混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return UIImage
 */
- (UIImage *)darkenBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:58
 *
 *  差分混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return UIImage
 */
- (UIImage *)differenceBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:07
 *
 *  ➗？？？感觉这个才是差分混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return UIImage
 */
- (UIImage *)divideBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:29
 *
 *  排除混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return UIImage
 */
- (UIImage *)exclusionBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:29
 *
 *  硬光混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return UIImage
 */
- (UIImage *)hardLightBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-22 16:07:39
 *
 *  色彩混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return UIImage
 */
- (UIImage *)hueBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-25 10:07:32
 *
 *  减轻混合模式
 *
 *  @param bgImage 背景图片
 *
 *  @return UIImage
 */
- (UIImage *)LightenBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-25 10:07:15
 *
 *  线性燃烧混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return UIImage
 */
- (UIImage *)linearBurnBlendModeWithBGImage:(UIImage *)bgImage;

/**
 *  @author Gaof, 16-07-25 10:07:47
 *
 *  线性减轻混合模式
 *
 *  @param bgImage 背景图
 *
 *  @return UIImage
 */
- (UIImage *)linearDodgeBlendModeWithBGImage:(UIImage *)bgImage;

#pragma mark - CICategoryDistortionEffect  - 图形变化
/**
 *  @author Gaof, 16-07-25 11:07:08
 *
 *  肿起模式变换
 *
 *  @param center  中心点
 *  @param radious 半径
 *  @param scale 缩放量
 *
 *  @return UIImage
 */
- (UIImage *)bumpDistortionWithCenter:(CGPoint)center andRadous:(CGFloat)radious andScale:(CGFloat)scale;

/**
 *  @author Gaof, 16-07-25 14:07:17
 *
 *  循环包起来
 *
 *  @param center  中心点
 *  @param radious 半径
 *  @param angle   角度
 *
 *  @return UIImage
 */
- (UIImage *)circularWrapWithCenter:(CGPoint)center andRadous:(CGFloat)radious andAngle:(CGFloat)angle;

/**
 *  @author Gaof, 16-07-25 14:07:59
 *
 *  替换变形
 *
 *  @param displacementImage 替代的图片
 *  @param scale             输入形变度
 *
 *  @return UIImage
 */
- (UIImage *)displacementDistortionWithDisplacementImage:(UIImage *)displacementImage andInputScale:(CGFloat)scale;

/**
 *  @author Gaof, 16-07-25 14:07:53
 *
 *  玻璃形变
 *
 *  @param texture 纹理图片
 *  @param center  中心点
 *  @param scale 缩放量
 *
 *  @return UIImage
 */
- (UIImage *)glassDistortionWithTextrure:(UIImage *)texture andCenter:(CGPoint)center andScale:(CGFloat)scale;

/**
 *  @author Gaof, 16-07-25 14:07:47
 *
 *  菱形形变
 *
 *  @param point0     default [150,150]
 *  @param point1     default [350,350]
 *  @param radius     distince default 100 ** min 100 ~ 1000 **
 *  @param refraction scalar default 1.7  ** min 0 ~ 5 max **
 *
 *  @return UIImage
 */
- (UIImage *)glassLozengeWithPoint0:(CGPoint)point0 andPoint1:(CGPoint)point1 andRadius:(CGFloat)radius andRefraction:(CGFloat)refraction;

/**
 *  @author Gaof, 16-07-25 16:07:48
 *
 *  黑洞污染
 *
 *  @param center 黑洞中心
 *  @param radius 半径
 *
 *  @return UIImage
 */
- (UIImage *)holeDistortionWithInputCenter:(CGPoint)center andRadius:(CGFloat)radius;

/**
 *  @author Gaof, 16-07-25 16:07:48
 *
 *  光的隧道？？？
 *
 *  @param center   中心点
 *  @param rotation 角度
 *  @param radius   半径
 *
 *  @return UIImage
 */
- (UIImage *)lightTunnelWithCenter:(CGPoint)center andRotation:(CGFloat)rotation andRadius:(CGFloat)radius;

/**
 *  @author Gaof, 16-07-25 17:07:48
 *
 *  捏合变形
 *
 *  @param center 中心点
 *  @param radius 半径
 *  @param scale  伸缩
 *
 *  @return UIImage
 */
- (UIImage *)pinchDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andScale:(CGFloat)scale;

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
 *  @return UIImage
 */
- (UIImage *)torusLensDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andWith:(CGFloat)width andRefraction:(CGFloat)refraction;

/**
 *  @author Gaof, 16-07-26 10:07:06
 *
 *  扭曲形变
 *
 *  @param center 中心点
 *  @param radius 半径 default 300  ** 0 ~ 500 **
 *  @param angle  角度 default 0    ** -12.566 ~ 12.566 **
 *
 *  @return UIImage
 */
- (UIImage *)TwirDistortionWithCenter:(CGPoint)center andRadius:(CGFloat)radius andAngle:(CGFloat)angle;

/**
 *  @author Gaof, 16-07-25 15:07:29
 *
 *  给图片上色
 *
 *  @param color 目标颜色
 *
 *  @return UIImage
 */
- (UIImage *)paintingWithColor:(UIColor *)color;

/**
 *  @author Gaof, 16-07-25 15:07:39
 *
 *  黑白色图片
 *
 *  @return UIImage
 */
- (UIImage *)noirEffectImage;

/**
 *  边缘检测算法
 *
 *  @param inputIntensity 边缘宽度
 *
 *  @return UIImage
 */
- (UIImage *)edgedJudgeWithInstance:(CGFloat)inputIntensity;
#pragma mark - 公共模块
/**
 *  @author Gaof, 16-07-20 15:07:19
 *
 *  转换成CIImage
 *
 *  @return CIImage
 */
- (CIImage *)ciimage;

- (UIImage *)normalizedImage;
@end
