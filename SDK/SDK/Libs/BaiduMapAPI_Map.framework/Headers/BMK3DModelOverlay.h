//
//  BMK3DModelOverlay.h
//  MapComponent
//
//  Created by zhaoxiangru on 2021/4/28.
//  Copyright © 2021 Baidu. All rights reserved.
//

#import "BMKOverlay.h"
#import "BMKShape.h"
NS_ASSUME_NONNULL_BEGIN
/// 3D模型文件格式
enum BMK3DModelType
{
    BMK3DModelTypeObj = 0, /// .obj
    BMK3DModelTypeGLTF, /// .glTF
};
typedef enum BMK3DModelType BMK3DModelType;

@interface BMK3DModelOption : NSObject <NSCopying>
/// 缩放比例，默认1.0
@property (nonatomic, assign) CGFloat scale;
/// scale不随地图缩放而变化，默认为NO
@property (nonatomic, assign) BOOL zoomFixed;
/// 旋转角度，取值范围为[0.0f, 360.0f]，默认为0.0
@property (nonatomic, assign) CGFloat rotateX;
@property (nonatomic, assign) CGFloat rotateY;
@property (nonatomic, assign) CGFloat rotateZ;
/// 偏移像素，默认为0.0
@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat offsetY;
@property (nonatomic, assign) CGFloat offsetZ;
/// 3D模型文件格式，默认BMK3DModelTypeObj
@property (nonatomic, assign) BMK3DModelType type;
/// 模型文件路径
@property (nonatomic, copy)  NSString *modelPath;
/// 模型名
@property (nonatomic, copy) NSString *modelName;
/// 以下只支持带有animations标签的GLTF模型
/// 模型动画是否可用，默认为NO：添加后不执行动画，值为YES时添加后立即按照配置参数执行动画，since 6.5.7
@property (nonatomic, assign) BOOL animationIsEnable;
/// 模型动画重复执行次数，默认0：动画将一直执行动画，since 6.5.7
@property (nonatomic, assign) NSInteger animationRepeatCount;
/// 当前模型动画索引值，since 6.5.7
@property (nonatomic, assign) NSInteger animationIndex;
/// 模型动画倍速，默认：1.0，since 6.5.7
@property (nonatomic, assign) CGFloat animationSpeed;
@end

@interface BMK3DModelOverlay : BMKShape <BMKOverlay>
/// 模型中心经纬度坐标
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) BMK3DModelOption *option;

/// 根据模型生成对应的overlay
/// @param centerCoordinate 中心坐标
/// @param option 模型可选数据
+ (nullable instancetype)modelOverlayWithCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate option:(BMK3DModelOption *)option;

/// 更新overlay
/// @param centerCoordinate 中心坐标
/// @param option 模型可选数据
- (void)setModelOverlayWithCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate option:(BMK3DModelOption *)option;
@end

NS_ASSUME_NONNULL_END
