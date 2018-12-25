//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Router.h"

@protocol BroadcastService;
@protocol UserService;

@interface RouterImpl : NSObject <Router>
- (instancetype)initWithBroadcastService:(NSObject <BroadcastService> *)broadcastService userService:(NSObject <UserService> *)userService;

@end