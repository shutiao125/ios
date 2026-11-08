//
//  BMKPrismOverlayView.h
//  MapComponent
//
//  Created by zhangbaojin on 2021/4/19.
//  Copyright © 2021 Baidu. All rights reserved.
//

#ifndef BMKPrismOverlayView_h
#define BMKPrismOverlayView_h

#import "BMKOverlayGLBasicView.h"
#import "BMKPrismOverlay.h"

/// 自定义建筑物楼层动画
enum BMKBuildingFloorAnimateType
{
    kBMKBuildingFloorAnimateSlow = 0,    ///< 慢
    kBMKBuildingFloorAnimateNormal,      ///< 正常
    kBMKBuildingFloorAnimateFast         ///< 快
};
typedef enum BMKBuildingFloorAnimateType BMKBuildingFloorAnimateType;

@protocol BMKPrismOverlayViewDelegate;


NS_ASSUME_NONNULL_BEGIN

/// 此类用于定义一个3D棱柱View since 6.4.0
@interface BMKPrismOverlayView : BMKOverlayGLBasicView

/// 根据指定的3D棱柱生成一个3D棱柱View
/// @param prismOverlay 指定的3D棱柱数据对象
/// @return 新生成的多边形View
- (nullable instancetype)initWithPrismOverlay:(BMKPrismOverlay *)prismOverlay;

/// 该View对应的3D棱柱数据对象
@property (nonatomic, readonly) BMKPrismOverlay *prismOverlay;

/// 3D棱柱代理 since 6.5.7
@property (nonatomic, weak) id<BMKPrismOverlayViewDelegate> delegate;

/// 3D棱柱顶面颜色
@property (nonatomic, strong) UIColor *topFaceColor;

/// 3D棱柱侧面颜色
@property (nonatomic, strong) UIColor *sideFaceColor;

/// 3D棱柱侧面纹理
@property (nonatomic, strong) UIImage *sideTextureImage;


@end

@interface BMKPrismOverlayView (BuildingAPI)

/// 自定义建筑物的楼层颜色 (仅对建筑物生效) since 6.5.7
@property (nonatomic, strong) UIColor *floorColor;

/// 自定义建筑物的楼层侧面纹理 (仅对建筑物生效) since 6.5.7
@property (nonatomic, strong, nullable) UIImage *floorSideTextureImage;

/// 是否开启生长动画 (仅对建筑物生效)，默认YES
@property (nonatomic, assign) BOOL isGrowthAnimation;

/// 自定义建筑物显示层级 (仅对建筑物生效), 默认18
@property (nonatomic, assign) int showLevel;

/// 自定义建筑物的楼层动画类型
/// 默认 kBMKBuildingFloorAnimateNormal
@property (nonatomic, assign) BMKBuildingFloorAnimateType buildingFloorAnimateType;

@end

/// 3D棱柱代理
@protocol BMKPrismOverlayViewDelegate <NSObject>
@optional

/// 楼层动画结束回调
- (void)prismOverlayViewFloorAnimationDidEnd:(BMKPrismOverlayView *)prismOverlayView;

@end

NS_ASSUME_NONNULL_END

#endif /* BMKPrismOverlayView_h */
