//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserService.h"

@protocol AuthorizationApi;

@interface UserServiceImpl : NSObject <UserService>

- (instancetype)initWithAuthorizeApi:(NSObject <AuthorizationApi> *)authorizeApi;
+ (instancetype)serviceWithAuthorizeApi:(NSObject <AuthorizationApi> *)authorizeApi;

@end