//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@interface AuthorizeViewModel : BaseViewModel

@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, assign) void (^onError)(NSString * message);

- (instancetype)initWithUserService:(NSObject *)userService;
- (void)login;

@end