#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CTMediator+ComponentA.h"
#import "CTMediator+ComponentB.h"
#import "RouteBlockManager.h"
#import "RoutePublicHeader.h"
#import "RouteProtocolManager.h"
#import "RoutePublicProtocols.h"

FOUNDATION_EXPORT double ComponentMediatorVersionNumber;
FOUNDATION_EXPORT const unsigned char ComponentMediatorVersionString[];

