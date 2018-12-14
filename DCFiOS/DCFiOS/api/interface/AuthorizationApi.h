//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FloUser;
@class LoginParameter;
@class Credentials;

@protocol AuthorizationApi <NSObject>

- (void)signIn:(LoginParameter *)params complete:(void (^)(FloUser *, Credentials * credentials, NSError *))handler;

@end