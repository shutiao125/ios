/*
 *  BMKLocationViewDisplayParam.h
 *  BMapKit
 *
 *  Copyright 2013 Baidu Inc. All rights reserved.
 *
 */
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


/**
 LocationView在mapview上显示的层级

 - LOCATION_VIEW_HIERARCHY_TOP: locationView在最上层
 - LOCATION_VIEW_HIERARCHY_BOTTOM: locationView在最下层
 */
typedef NS_ENUM(NSUInteger, LocationViewHierarchy) {
    LOCATION_VIEW_HIERARCHY_TOP,
    LOCATION_VIEW_HIERARCHY_BOTTOM,
};

/// 此类表示定位图层自定义样式参数
@interface BMKLocationViewDisplayParam : NSObject <NSCopying>

/// 定位图标X轴偏移量(屏幕坐标)
@property (nonatomic, assign) CGFloat locationViewOffsetX;
/// 定位图标Y轴偏移量(屏幕坐标)
@property (nonatomic, assign) CGFloat locationViewOffsetY;
/// 精度圈是否显示，默认YES
@property (nonatomic, assign) BOOL isAccuracyCircleShow;
/// 精度圈 填充颜色
@property (nonatomic, strong) UIColor *accuracyCircleFillColor;
/// 精度圈 边框颜色
@property (nonatomic, strong) UIColor *accuracyCircleStrokeColor;
/// 精度圈 边框宽度，默认1.6point，since 6.5.7
@property (nonatomic, assign) CGFloat accuracyCircleBorderWidth;
/// 跟随态旋转角度是否生效，默认YES
@property (nonatomic, assign) BOOL isRotateAngleValid;
/// 定位图标名称，需要将该图片放到 mapapi.bundle/images 目录下
@property (nonatomic, strong) NSString *locationViewImgName;
/// 用户自定义定位图标，V4.2.1以后支持
@property (nonatomic, strong) UIImage *locationViewImage;
/// 是否显示气泡，默认YES
@property (nonatomic, assign) BOOL canShowCallOut;
/// locationView在mapview上的层级 默认值为LOCATION_VIEW_HIERARCHY_BOTTOM
@property (nonatomic, assign) LocationViewHierarchy locationViewHierarchy;
/// 是否是定位图标箭头样式自定义，YES：箭头样式自定义， NO：整体样式自定义，默认NO
@property (nonatomic, assign) BOOL isLocationArrowStyleCustom;

/* 以下为定位图标整体样式自定义，自定义图片和gif图二选一，Gif图优先级大于图片*/
/// 新版用户自定义定位图标，since 6.5.7
@property (nonatomic, strong) UIImage *locationViewImageNew;
/// 定位图标整体样式自定义gif图文件路径，since 6.5.7
@property (nonatomic, copy) NSString *locationViewGifImageFilePath;
/// 定位图标整体样式自定义大小缩放系数，默认为1，可设置范围0.1～2.0，基于固定尺寸CGSizeMake(30, 30)缩放，since 6.5.7
@property (nonatomic, assign) CGFloat locationViewImageSizeScale;
/// 定位图标整体样式自定义呼吸效果，默认为NO，since 6.5.7
@property (nonatomic, assign) BOOL breatheEffectOpenForWholeStyle;
/* 以下为箭头样式定位图标自定义，可分别自定义中心圆点图片和箭头图片，中心图标自定义图片和gif图二选一，Gif图优先级大于图片*/
/// 箭头样式定位图标中心图片，无方向，since 6.5.7
@property (nonatomic, strong) UIImage *locationViewCenterImage;
/// 箭头样式定位图标中心圆点gif图文件路径，无方向，since 6.5.7
@property (nonatomic, copy) NSString *locationViewCenterGifImageFilePath;
/// 箭头样式定位图标中心圆点图片大小缩放系数，默认为1，可设置范围0.1～2.0，基于固定尺寸CGSizeMake(30, 30)缩放，since 6.5.7
@property (nonatomic, assign) CGFloat locationViewCenterImageSizeScale;
/// 箭头样式定位图标周边箭头轮廓图片，箭头向上为正，since 6.5.7
@property (nonatomic, strong) UIImage *locationViewAroundArrowsImage;
/// 箭头样式定位图标周边箭头轮廓图片大小缩放系数，默认为1，可设置范围0.2～3.0，基于图片大小缩放，since 6.5.7
@property (nonatomic, assign) CGFloat locationViewAroundArrowsImageSizeScale;
/// 箭头样式定位图标呼吸效果，默认为YES，since 6.5.7
@property (nonatomic, assign) BOOL breatheEffectOpenForArrowsStyle;

@end



