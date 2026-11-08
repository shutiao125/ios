//
//  BMKLineDrawType.h
//  MapComponent
//
//  Created by zhangbaojin on 2019/8/7.
//  Copyright © 2019 Baidu. All rights reserved.
//

#ifndef BMKLineDrawType_h
#define BMKLineDrawType_h
/// line拐角处理方式（不支持虚线）
enum BMKLineJoinType
{
    kBMKLineJoinBevel = 0,    ///< 平角衔接
    kBMKLineJoinMiter,       ///< 尖角衔接(尖角过长(大于线宽)按平角处理)
    kBMKLineJoinRound,      ///< 圆⻆衔接
    kBMKLineJoinBerzier    ///< 贝塞尔平滑衔接(仅支持多纹理和多颜色的polyline绘制) 此衔接不可以与kBMKLineCapRound配合使用
};
typedef enum BMKLineJoinType BMKLineJoinType;

/// line头尾处理方式(不支持虚线)
enum BMKLineCapType
{
    kBMKLineCapButt = 0,     ///< 普通头
    kBMKLineCapRound,        ///< 圆形头
    kBMKLineCapSquare        ///< 方头
};
typedef enum BMKLineCapType BMKLineCapType;

/// 虚线绘制样式
 enum BMKLineDashType
{
    kBMKLineDashTypeNone = 0,    ///< 实折线
    kBMKLineDashTypeSquare,     ///< 方块样式
    kBMKLineDashTypeDot,        ///< 圆点样式
    kBMKLineDashTypeRectangle   ///< 矩形样式 since 6.6.0
};
typedef enum BMKLineDashType BMKLineDashType;

/// line跨经度180方式
enum BMKLineDirectionCross180Type
{
    kBMKLineDirectionCross180TypeNone = 0,       ///< 不跨180经度
    kBMKLineDirectionCross180TypeEAST_TO_WEST,  ///< 从东到西跨180经度
    kBMKLineDirectionCross180TypeWEST_TO_EAST  ///< 从西到东跨180经度
};
typedef enum BMKLineDirectionCross180Type BMKLineDirectionCross180Type;


/// line发光模式
 enum BMKLineBloomMode
{
    kBMKLineBloomModeNone = 0,    ///< 不发光
    kBMKLineBloomModeGradient,    ///< 渐变发光模式，since 6.5.9暂不支持
    kBMKLineBloomModeBlur        ///< 模糊发光模式
};
typedef enum BMKLineBloomMode BMKLineBloomMode;

#endif /* BMKLineDrawType_h */
