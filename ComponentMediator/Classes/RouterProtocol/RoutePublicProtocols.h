//
//  RouterProtocols.h
//  ZSProject
//
//  Created by zhoushuai on 2021/5/14.
//  Copyright © 2021 zhoushuai. All rights reserved.
//

#ifndef RoutePublicProtocols_h
#define RoutePublicProtocols_h

#import <Foundation/Foundation.h>

@protocol ComponentAProtocol <NSObject>

+ (UIViewController *)fetchComponentAVCWithTitle:(NSString *)title;

@end


@protocol ComponentBProtocol <NSObject>

+ (UIViewController *)fetchComponentBVCWithTitle:(NSString *)title;

@end



#endif /* RoutePublicProtocols_h */
