//
//  BMKTraceOverlayOption.h
//  MapComponent
//
//  Created by Baidu on 2021/5/15.
//  Copyright © 2021 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMK3DModelOverlay.h"

/// 动画类型
typedef NS_ENUM(NSInteger, BMKTraceOverlayAnimationEasingCurve) {
    BMKTraceOverlayAnimationEasingCurveLinear, /// 线性
    BMKTraceOverlayAnimationEasingCurveEaseIn, /// 淡入
    BMKTraceOverlayAnimationEasingCurveEaseOut, /// 淡出
    BMKTraceOverlayAnimationEasingCurveEaseInOut /// 淡入淡出
};

/*
 * 轨迹动画中模型的偏航轴，即模型与右手坐标系Z轴重合的轴
 */
typedef NS_ENUM(NSInteger, BMKTraceOverlay3DModelYawAxis) {
    BMKTraceOverlay3DModelYawAxisZ,
    BMKTraceOverlay3DModelYawAxisX,
    BMKTraceOverlay3DModelYawAxisY,
};

NS_ASSUME_NONNULL_BEGIN

@interface BMKTrace3DModelOption : BMK3DModelOption
/// 轨迹动画中模型的偏航轴，即模型与右手坐标系Z轴重合的轴
@property (nonatomic, assign) BMKTraceOverlay3DModelYawAxis modelYawAxis;
@end


@interface BMKTraceOverlayOption : NSObject

/// polyline是否做动画, 默认YES
@property (nonatomic, assign) BOOL animate;
/// 动画延时开始，单位s
@property (nonatomic, assign) NSTimeInterval delay;
/// 动画时间，单位s
@property (nonatomic, assign) NSTimeInterval duration;
/// 0~1， 默认0
@property (nonatomic, assign) CGFloat fromValue;
/// 0~1，默认1
@property (nonatomic, assign) CGFloat toValue;
/// 动画类型
@property (nonatomic, assign) BMKTraceOverlayAnimationEasingCurve easingCurve;
/// 是否跟踪轨迹, 默认YES
@property (nonatomic, assign) BOOL trackMove;
/// 轨迹跟踪时地图是否跟着旋转, 默认YES
@property (nonatomic, assign) BOOL isRotateWhenTrack;
/// 点平滑移动, 默认NO，设置为YES时可配合pointImage设置点图片或可根据animationTraceMovePosition动画代理回调实时位置自定义添加AnnotationView或3D模型
@property (nonatomic, assign) BOOL pointMove;
/// 自定义Point图片，无默认图片，小车等带方向的图片车头向右为正方向
@property (nonatomic, strong) UIImage *pointImage;
/// 3d模型
@property (nonatomic, strong) BMKTrace3DModelOption *modelOption;
@end

NS_ASSUME_NONNULL_END
