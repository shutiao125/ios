//
//  UNIADWMSplashAdapter.h
//  wm_adapter
//
//  Created by 周泽浩 on 2022/12/28.
//

#import <Foundation/Foundation.h>
#import <DCUniAdFoundation//DCUniAdFoundation.h>


NS_ASSUME_NONNULL_BEGIN
@interface UNIADWMSplashAdapter : NSObject <DCUniAdCustomSplashAdapter>
@property (nonatomic, assign) BOOL hasLoadSucc;
@property (nonatomic, assign) NSInteger statusTag;
@property (nonatomic, assign) NSInteger biddingType;
@property (nonatomic, weak) id<DCUniAdCustomSplashAdapterBridge> bridge;
- (instancetype)initWithBridge:(id<DCUniAdCustomSplashAdapterBridge>)bridge;
@end

NS_ASSUME_NONNULL_END
