//
//  RouterManager.m
//  ZSProject
//
//  Created by zhoushuai on 2021/5/14.
//  Copyright © 2021 zhoushuai. All rights reserved.
//

#import "RouteProtocolManager.h"

@interface RouteProtocolManager()

@property (nonatomic, strong) NSMutableDictionary *protocolCache;

@end


@implementation RouteProtocolManager

#pragma mark - Life Cycle

+ (instancetype)instance {
    static dispatch_once_t onceToken;
    static RouteProtocolManager *manager = nil;
    
    dispatch_once(&onceToken, ^{
        manager = [RouteProtocolManager new];
        manager.protocolCache = @{}.mutableCopy;
    });
    return manager;
}

- (void)loadModuleFromPlist:(NSString *)plistPath {
    
}

- (NSArray *)allModules {
    return _protocolCache.allKeys;
}



#pragma mark - Public Methods

+ (void)registerClass:(Class)class forProtocol:(Protocol *)protocol {
    NSMutableDictionary *protocolCache = [[RouteProtocolManager instance] protocolCache];
    [protocolCache setObject:class forKey:NSStringFromProtocol(protocol)];
}

+ (Class)classForProtocol:(Protocol *)protocol {
    NSMutableDictionary *protocolCache = [[RouteProtocolManager instance] protocolCache];
    return protocolCache[NSStringFromProtocol(protocol)];
}




@end
