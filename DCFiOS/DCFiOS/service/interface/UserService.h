//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FloUser;
@class LoginParameter;

@protocol AuthenticationObserver;

@protocol UserService <NSObject>
@required

- (void)signIn:(LoginParameter*) params complete:(void(^)(FloUser * user, NSError * error))handler;

- (void)subscribeOnAuthentication:(NSObject <AuthenticationObserver> *)subscriber;

- (void)logOut;
@end