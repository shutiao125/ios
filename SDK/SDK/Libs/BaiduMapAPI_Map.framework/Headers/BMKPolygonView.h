/*
 *  BMKPolygonView.h
 *  BMapKit
 *
 *  Copyright 2011 Baidu Inc. All rights reserved.
 *
 */

#import "BMKGeometryView.h"
#import "BMKPolygon.h"


NS_ASSUME_NONNULL_BEGIN
/// 此类用于定义一个多边形View
@interface BMKPolygonView : BMKGeometryView

/// 根据指定的多边形生成一个多边形View
/// @param polygon 指定的多边形数据对象
/// @return 新生成的多边形View
- (nullable instancetype)initWithPolygon:(BMKPolygon *)polygon;

/// 该View对应的多边形数据
@property (nonatomic, readonly) BMKPolygon *polygon;

/// 是否可点击，默认NO
@property (assign, nonatomic) BOOL isClickable;

/// 镂空区域是否可点击，默认NO：点中镂空区域时不触发该overlay的点击回调
@property (assign, nonatomic) BOOL isHoleClickable;

/// isHoleClickable为YES时，触发回调的镂空索引值，默认-1:点中的是非镂空区域;索引对应polygon.hollowShapes,倒序遍历，即优先触发后添加的镂空
@property (assign, nonatomic) NSInteger holeClickedIndex;

@end
NS_ASSUME_NONNULL_END
