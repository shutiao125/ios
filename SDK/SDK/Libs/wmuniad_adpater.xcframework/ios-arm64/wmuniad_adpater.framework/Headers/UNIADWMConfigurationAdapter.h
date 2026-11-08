//
//  UNIADWMConfigurationAdapter.h
//  wm_adapter
//
//  Created by 周泽浩 on 2022/12/27.
//

#import <Foundation/Foundation.h>
#import <DCUniAdFoundation/DCUniAdFoundation.h>
// WX_APP_ID和WX_APP_UNIVERSAL_LINK 是支持跳转微信小程序所需的参数[可选],配置在BUAdSDKConfiguration中的mediation属性中的extraDeviceMap属性中,key值分别为WX_APP_ID,WX_APP_UNIVERSAL_LINK
#define WX_APP_ID  @"wx_app_id"
#define WX_APP_UNIVERSAL_LINK  @"wechat_universal_link"

NS_ASSUME_NONNULL_BEGIN

@interface UNIADWMConfigurationAdapter : NSObject<DCUniAdCustomConfigAdapter>

@end

NS_ASSUME_NONNULL_END
