//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@protocol UserService;

@interface AuthorizeViewModel : BaseViewModel

@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, copy) void (^onError)(NSString * message);

- (instancetype)initWithUserService:(NSObject <UserService> *)userService;
- (void)login;

@end
