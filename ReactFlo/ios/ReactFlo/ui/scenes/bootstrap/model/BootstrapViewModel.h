//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "BroadcastService.h"

@protocol BroadcastService;
@protocol UserService;

@interface BootstrapViewModel : BaseViewModel <AuthenticationObserver>
@property(nonatomic, copy) void (^onSignedIn)();
@property(nonatomic, copy) void (^onSignedOut)();

- (instancetype)initWithBroadcastService:(NSObject <BroadcastService> *)broadcastService userService:(NSObject <UserService> *)userService;
- (void)autoLogin;

@end