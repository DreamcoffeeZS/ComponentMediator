//
//  RouterManager.h
//  ZSProject
//
//  Created by zhoushuai on 2021/5/14.
//  Copyright © 2021 zhoushuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoutePublicProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface RouteProtocolManager : NSObject 

//获取远程配置的组件URLs
+ (instancetype)instance;

- (void)loadModuleFromPlist:(NSString *)plistPath;

- (NSArray *)allModules;


/// 注册组件
/// @param xClass 组件关联的类
/// @param protocol 组件协议
+ (void)registerClass:(Class)xClass forProtocol:(Protocol *)protocol;

//获取组件
+ (Class)classForProtocol:(Protocol *)protocol;

@end

NS_ASSUME_NONNULL_END
