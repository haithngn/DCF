//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FloUser;
@class LoginParams;

@protocol AuthorizationApi <NSObject>

- (void)signIn:(LoginParams *)params complete:(void (^)(FloUser *user, NSError *error))handler;

@end