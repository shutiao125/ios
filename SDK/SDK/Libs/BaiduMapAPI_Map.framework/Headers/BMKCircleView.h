/*
 *  BMKCircleView.h
 *  BMapKit
 *
 *  Copyright 2011 Baidu Inc. All rights reserved.
 *
 */

#import "BMKGeometryView.h"
#import "BMKCircle.h"

NS_ASSUME_NONNULL_BEGIN
/// 该类用于定义圆对应的View
@interface BMKCircleView : BMKGeometryView

/// 根据指定圆生成对应的View
/// @param circle 指定的圆
/// @return 生成的View
- (nullable instancetype)initWithCircle:(BMKCircle *)circle;

/// 该View对应的圆
@property (nonatomic, readonly) BMKCircle *circle;

/// 是否可点击，默认NO
@property (assign, nonatomic) BOOL isClickable;

/// 镂空区域是否可点击，默认NO：点中镂空区域时不触发该overlay的点击回调
@property (assign, nonatomic) BOOL isHoleClickable;

/// isHoleClickable为YES时，触发回调的镂空索引值，默认-1:点中的是非镂空区域
@property (assign, nonatomic) NSInteger holeClickedIndex;

@end
NS_ASSUME_NONNULL_END
