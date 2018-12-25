//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BroadcastService;


@interface AuthorizeOSXViewModel : NSObject
@property(nonatomic, copy) void (^onAuthorize)(void);
@property(nonatomic, copy) void (^onUnauthorize)();

- (instancetype)initWithBroadcastService:(NSObject <BroadcastService> *)broadcastService;


@end