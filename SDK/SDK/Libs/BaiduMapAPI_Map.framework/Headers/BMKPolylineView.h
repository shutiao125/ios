/*
 *  BMKPolylineView.h
 *  BMapKit
 *
 *  Copyright 2011 Baidu Inc. All rights reserved.
 *
 */

#import "BMKGeometryView.h"
#import "BMKPolyline.h"

NS_ASSUME_NONNULL_BEGIN
/// 此类用于定义一个折线View
@interface BMKPolylineView : BMKGeometryView

/// 根据指定的折线生成一个折线View
/// @param polyline 指定的折线数据对象
/// @return 新生成的折线View
- (nullable instancetype)initWithPolyline:(BMKPolyline *)polyline;

/// 该View对应的折线数据对象
@property (nonatomic, readonly) BMKPolyline *polyline;

/// LineJoinType，默认是kBMKLineJoinBevel（不支持虚线）
@property (nonatomic, assign) BMKLineJoinType lineJoinType;

/// LineCapType，默认是kBMKLineCapButt (不支持虚线)
@property (nonatomic, assign) BMKLineCapType lineCapType;

/// 是否可点击，默认YES；since 6.5.7
@property (nonatomic, assign) BOOL isClickable;

/// 发光模式，仅支持颜色实折线；since 6.5.7
/// 默认不发光，kBMKLineBloomModeNone
@property (nonatomic, assign) BMKLineBloomMode lineBloomMode;

/// 发光处宽度，默认 0.0f；since 6.5.7
@property (nonatomic, assign) CGFloat lineBloomWidth;

/// 发光处透明度，取值范围 [0 ~ 255]，默认 255.0f；since 6.5.7
@property (nonatomic, assign) CGFloat lineBloomAlpha;

/// 透明度渐变速度 since 6.5.7
/// 取值范围 [1.0f ~ 10.0f]，默认值为 5.0f
/// 注意：渐变发光模式下该属性生效，since 6.5.9暂不支持
@property (nonatomic, assign) CGFloat lineBloomGradientASPeed;

/// 模糊次数 since 6.5.7
/// 取值范围 [1~10]，默认值为 1
/// 注意：模糊发光模式下该属性生效，since 6.5.9可以替代渐变发光模式的lineBloomGradientASPeed
@property (nonatomic, assign) int lineBloomBlurTimes;

#pragma mark - 以下方法和属性只适用于分段纹理绘制/分段颜色绘制

/// 是否分段纹理/分段颜色绘制（突出显示），默认YES，YES:使用分段纹理绘制 NO:使用默认的灰色纹理绘制
@property (nonatomic, assign) BOOL isFocus __deprecated_msg("已废弃since 5.0.0");

/// 使用分段颜色绘制时，必须设置（内容必须为UIColor）
/// 注：请使用 - (UIColor *)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha; 初始化UIColor。
/// 使用[UIColor ***Color]初始化时，个别case转换成RGB后会有问题
@property (nonatomic, copy, nullable) NSArray<UIColor *> *colors __deprecated_msg("已废弃since 6.5.0, 请使用BMKMultiColorPolylineView中strokeColors");

@end
NS_ASSUME_NONNULL_END
