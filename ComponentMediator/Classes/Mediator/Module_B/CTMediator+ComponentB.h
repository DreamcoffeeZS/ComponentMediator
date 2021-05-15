//
//  CTMediator+ComponentB.h
//  ZSProject
//
//  Created by zhoushuai on 2021/5/15.
//  Copyright © 2021 zhoushuai. All rights reserved.
//

#import "CTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (ComponentB)

- (UIViewController *)mediator_fetchComponentBVC:(NSDictionary *)params;

- (UIViewController *)mediator_fetchComponentBDetailVC:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
