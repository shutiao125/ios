//
//  BMKParticleEffectOption.h
//  MapComponent
//
//  Created by zhaoxiangru on 2023/2/23.
//  Copyright © 2023 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BMKParticleEffectOption : NSObject
/// 自定义粒子图片列表，图片列表需按如下要求顺序传入：
/// 不同类型粒子效果图片定义列表及参考图片尺寸（2倍图）
/// BMKMapParticleEffectSnow：[雪点图片16*16，雪花图片32*32]
/// BMKMapParticleEffectRainStorm：[雨点图片4*32，乌云图片128*64]
/// BMKMapParticleEffectSmog：[雾霾图片32*32]
/// BMKMapParticleEffectSandStorm：[沙尘图片32*32，沙粒图片4*4]
/// BMKMapParticleEffectFireworks：[烟花图片32*32]
/// BMKMapParticleEffectFlower：[花瓣图片32*32]
@property(nonatomic, strong) NSArray <UIImage *> *images;

/// 点发射器发射位置，目前仅支持烟花粒子,默认为无效值，发射位置始终为地图中心点
@property(nonatomic, assign) CLLocationCoordinate2D location;
@end

NS_ASSUME_NONNULL_END
