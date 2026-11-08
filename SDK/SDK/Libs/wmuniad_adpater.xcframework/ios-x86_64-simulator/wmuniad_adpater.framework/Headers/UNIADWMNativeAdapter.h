//
//  UNIADWMNativeAdapter.h
//  wm_adapter
//
//  Created by 周泽浩 on 2023/1/3.
//

#import <Foundation/Foundation.h>
#import <DCUniAdFoundation/DCUniAdFoundation.h>

@interface UNIADWMNativeAdapter : NSObject <DCUniAdCustomNativeAdapter>
@property (nonatomic, assign) NSInteger statusTag;
@property (nonatomic, assign) NSInteger biddingType;
@property (nonatomic, weak) id<DCUniAdCustomNativeAdapterBridge> bridge;
- (instancetype)initWithBridge:(id<DCUniAdCustomNativeAdapterBridge>)bridge;
@end

