//
//  UNIADWMInterstitialAdapter.h
//  wm_adapter
//
//  Created by 周泽浩 on 2022/12/29.
//

#import <Foundation/Foundation.h>
#import <DCUniAdFoundation/DCUniAdFoundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface UNIADWMInterstitialAdapter : NSObject <DCUniAdCustomInterstitialAdapter>

@property (nonatomic, assign) NSInteger statusTag;
@property (nonatomic, assign) BOOL hasLoadSucc;
@property (nonatomic, assign) NSInteger biddingType;
@property (nonatomic, weak) id<DCUniAdCustomInterstitialAdapterBridge> bridge;
- (instancetype)initWithBridge:(id<DCUniAdCustomInterstitialAdapterBridge>)bridge;
@end

NS_ASSUME_NONNULL_END
