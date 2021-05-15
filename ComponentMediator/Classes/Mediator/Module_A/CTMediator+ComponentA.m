//
//  CTMediator+ComponentA.m
//  ZSProject
//
//  Created by zhoushuai on 2021/5/14.
//  Copyright © 2021 zhoushuai. All rights reserved.
//

#import "CTMediator+ComponentA.h"


NSString * const ZSMediatorTargetComponentA = @"ComponentA";

NSString * const ZSMediatorActionNativComponentAVC = @"nativeFetchComponentAVC";
NSString * const ZSMediatorActionNativComponentADetailVC = @"nativeFetchComponentADetailVC";

@implementation CTMediator (ComponentA)

- (UIViewController *)mediator_fetchComponentAVC:(NSDictionary *)params {
    
    UIViewController *vc = [self performTarget:ZSMediatorTargetComponentA
                                        action:ZSMediatorActionNativComponentAVC
                                        params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        //VC交付出去之后，可以由外界选择是push还是present
        return vc;
    }
    // 这里容错处理异常场景，具体如何处理取决于产品
    return [UIViewController new];
}

- (UIViewController *)mediator_fetchComponentADetailVC:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:ZSMediatorTargetComponentA action:ZSMediatorActionNativComponentADetailVC params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return [UIViewController new];
}
@end
