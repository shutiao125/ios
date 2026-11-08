//
//  BMKTraceOverlayView.h
//  MapComponent
//
//  Created by Baidu on 2021/5/13.
//  Copyright © 2021 Baidu. All rights reserved.
//

#import "BMKGeometryView.h"
#import "BMKTraceOverlay.h"

NS_ASSUME_NONNULL_BEGIN
/// 此类用于定义一个轨迹View since 6.4.0
@interface BMKTraceOverlayView : BMKGeometryView

/// 根据指定的轨迹生成一个轨迹View
/// @param traceOverlay 指定的轨迹数据对象
/// @return 新生成的轨迹View
- (nullable instancetype)initWithTraceOverlay:(BMKTraceOverlay *)traceOverlay;

/// 该View对应的折线数据对象
@property (nonatomic, readonly) BMKTraceOverlay *traceOverlay;

/// 使用分段颜色绘制时，必须设置（内容必须为UIColor）since 6.5.7
/// 注：请使用 - (UIColor *)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha; 初始化UIColor。
/// 使用[UIColor ***Color]初始化时，个别case转换成RGB后会有问题
/// 注意：strokeColors 长度与轨迹点的个数必须保持一致
@property (nonatomic, copy) NSArray<UIColor *> *strokeColors;

@end

NS_ASSUME_NONNULL_END
