//
//  BMKGradientLineView.h
//  MapComponent
//
//  Created by zhangbaojin on 2021/6/15.
//  Copyright © 2021 Baidu. All rights reserved.
//

#import "BMKGeometryView.h"
#import "BMKGradientLine.h"

NS_ASSUME_NONNULL_BEGIN
/// 此类用于定义一个颜色渐变线View since 6.4.0
@interface BMKGradientLineView : BMKGeometryView

/// 根据指定的颜色渐变线生成一个颜色渐变线View
/// @param gradientLine 指定的颜色渐变线数据对象
/// @return 新生成的颜色渐变线View
- (nullable instancetype)initWithGradientLine:(BMKGradientLine *)gradientLine;

/// 该View对应的颜色渐变线数据对象
@property (nonatomic, readonly) BMKGradientLine *gradientLine;

/// 渐变颜色数组
@property (nonatomic, copy) NSArray<UIColor *> *strokeColors;

/// 是否可点击，默认YES
@property (assign, nonatomic) BOOL isClickable;

/// 发光模式  since 6.5.7
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
/// 注意：模糊发光模式下该属性生效，since 6.5.9可以替代渐变发光模式的lineBloomGradientASPeed效果
@property (nonatomic, assign) int lineBloomBlurTimes;

@end

NS_ASSUME_NONNULL_END
