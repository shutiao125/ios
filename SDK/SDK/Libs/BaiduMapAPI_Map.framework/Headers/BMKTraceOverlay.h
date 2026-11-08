//
//  BMKTraceOverlay.h
//  MapComponent
//
//  Created by Baidu on 2021/5/13.
//  Copyright © 2021 Baidu. All rights reserved.
//

#import "BMKMultiPoint.h"
#import "BMKOverlay.h"
#import "BMKTraceOverlayOption.h"

@class BMKTraceOverlay;

NS_ASSUME_NONNULL_BEGIN

@protocol BMKTraceOverlayAnimationDelegate <NSObject>

@optional
/// 动画开始
- (void)traceOverlayAnimationDidStart:(BMKTraceOverlay *)traceOverlay;

/// 动画进度
/// @param traceOverlay BMKTraceOverlay
/// @param progress 进度 0.0 ~ 100.0
- (void)traceOverlay:(BMKTraceOverlay *)traceOverlay animationRunningProgress:(CGFloat)progress;

/// 追踪动画实时位置
/// @param traceOverlay BMKTraceOverlay
/// @param position 当前位置
- (void)traceOverlay:(BMKTraceOverlay *)traceOverlay animationTraceMovePosition:(CLLocationCoordinate2D)position;

/// 动画结束
/// @param traceOverlay BMKTraceOverlay
/// @param flag 动画是否完成
- (void)traceOverlay:(BMKTraceOverlay *)traceOverlay animationDidEnd:(BOOL)flag;

@end

@interface BMKTraceOverlay : BMKMultiPoint <BMKOverlay>
/// 动画代理
@property (nonatomic, weak, nullable) id<BMKTraceOverlayAnimationDelegate> delegate;
/// 动画参数
@property (nonatomic, strong, readonly) BMKTraceOverlayOption *overlayOption;
/// 是否使用渐变色 默认为NO since 6.5.7
@property (nonatomic, assign) BOOL isGradientColor;
/// 是否使用发光效果 默认为NO since 6.5.7
@property (nonatomic, assign) BOOL isTrackBloom;
/// 轨迹发光参数 since 6.5.7
/// 取值范围 [1.0f ~ 10.0f]，默认值为 5.0f
/// 注意：渐变发光模式下该属性生效
@property (nonatomic, assign) CGFloat bloomSpeed;
/// 轨迹动画暂停状态  since 6.5.9
@property (nonatomic, assign, readonly) BOOL onPauseStatus;
/// 当前轨迹的状态是否改变，标记轨迹是否从运行状态进入暂停状态。  since 6.5.9
@property (nonatomic, assign, readonly) BOOL isStatusChanged;
/// 暂停轨迹动画绘制  since 6.5.9
- (void)pauseTraceOverlayDraw;
/// 继续轨迹动画绘制  since 6.5.9
- (void)resumeTraceOverlayDraw;


/// 是否需要对TraceOverlay坐标数据进行抽稀，默认为YES
@property (nonatomic, assign) BOOL isThined;
/// 是否需要对TraceOverlay坐标数据进拐角平滑，默认为YES
@property (nonatomic, assign) BOOL isCornerSmooth;

/// 创建BMKTraceOverlay
/// @param coords 经纬度坐标数组
/// @param count 经纬度坐标数组大小
/// @param overlayOption 动画参数
+ (nullable instancetype)traceOverlayWithCoordinates:(CLLocationCoordinate2D *)coords
                                               count:(NSUInteger)count
                                              option:(BMKTraceOverlayOption *)overlayOption;

/// 创建BMKTraceOverlay
/// @param points 直角坐标数组
/// @param count 直角坐标数组大小
/// @param overlayOption 动画参数
+ (nullable instancetype)traceOverlayWithPoints:(BMKMapPoint *)points
                                          count:(NSUInteger)count
                                         option:(BMKTraceOverlayOption *)overlayOption;

/// 更新BMKTraceOverlay
/// @param coords 经纬度坐标数组
/// @param count 经纬度坐标数组大小
/// @param overlayOption 动画参数
- (BOOL)updateTraceOverlayCoordinates:(CLLocationCoordinate2D *)coords
                                count:(NSUInteger)count
                               option:(BMKTraceOverlayOption *)overlayOption;

/// 更新BMKTraceOverlay
/// @param coords 直角坐标数组
/// @param count 直角坐标数组大小
/// @param overlayOption 动画参数
- (BOOL)updateTraceOverlayPoints:(CLLocationCoordinate2D *)coords
                           count:(NSUInteger)count
                          option:(BMKTraceOverlayOption *)overlayOption;

@end

NS_ASSUME_NONNULL_END
