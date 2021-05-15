//
//  CTMediator+ComponentA.h
//  ZSProject
//
//  Created by zhoushuai on 2021/5/14.
//  Copyright © 2021 zhoushuai. All rights reserved.
//

#import "CTMediator.h"

@interface CTMediator (ComponentA)

- (UIViewController *)mediator_fetchComponentAVC:(NSDictionary *)params;

- (UIViewController *)mediator_fetchComponentADetailVC:(NSDictionary *)params;

@end


