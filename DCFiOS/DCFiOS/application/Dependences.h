//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCFiOS-Bridging-Header.h"

@class FloConfigurations;
@protocol UserService;

@interface Dependences : NSObject

+ (FloConfigurations*)configurations;
+ (NSObject <UserService>*) userService;

@end
