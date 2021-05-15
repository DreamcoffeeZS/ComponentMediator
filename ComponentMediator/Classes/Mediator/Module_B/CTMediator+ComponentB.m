//
//  CTMediator+ComponentB.m
//  ZSProject
//
//  Created by zhoushuai on 2021/5/15.
//  Copyright © 2021 zhoushuai. All rights reserved.
//

#import "CTMediator+ComponentB.h"


NSString * const ZSMediatorTargetComponentB = @"ComponentB";

NSString * const ZSMediatorActionNativComponentBVC = @"nativeFetchComponentBVC";
NSString * const ZSMediatorActionNativComponentBDetailVC = @"nativeFetchComponentBDetailVC";

@implementation CTMediator (ComponentB)

- (UIViewController *)mediator_fetchComponentBVC:(NSDictionary *)params {
    
    UIViewController *vc = [self performTarget:ZSMediatorTargetComponentB action:ZSMediatorActionNativComponentBVC params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return [UIViewController new];
}
- (UIViewController *)mediator_fetchComponentBDetailVC:(NSDictionary *)params {
    UIViewController *vc = [self performTarget:ZSMediatorTargetComponentB action:ZSMediatorActionNativComponentBDetailVC params:params shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return [UIViewController new];
}

@end
