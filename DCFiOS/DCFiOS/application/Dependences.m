//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloRest/FloRest.h>
#import "Dependences.h"
#import "UserService.h"
#import "UserServiceImpl.h"
#import "AuthorizationApiImpl.h"
#import "AuthorizationApi.h"

@interface Dependences ()

@property (nonatomic, strong) FloConfigurations * config;
@property (nonatomic, strong) NSObject <UserService> * userService;
@property (nonatomic, strong) NSObject <AuthorizationApi> * authorizationApi;

@end

@implementation Dependences {
@private
    NSObject <UserService> *_userService;
    NSObject <AuthorizationApi> *_authorizationApi;
    FloConfigurations *_config;
}

@synthesize userService = _userService;
@synthesize authorizationApi = _authorizationApi;

@synthesize config = _config;

+ (instancetype)sharedInstance {
    static Dependences *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[Dependences alloc] init];
    });

    return sharedInstance;
}

+ (FloConfigurations *)configurations {
    return [Dependences sharedInstance].config;
}

+ (NSObject <UserService> *)userService {
    return [Dependences sharedInstance].userService;
}

- (FloConfigurations *)config {
    if (_config == nil) {
        _config = [[FloConfigurations alloc] init];
    }
    return _config;
}

- (NSObject <UserService> *)userService {
    if (_userService == nil) {
        _userService = [[UserServiceImpl alloc] initWithAuthorizeApi:self.authorizationApi];
    }

    return _userService;
}

- (NSObject <AuthorizationApi> *)authorizationApi {
    if (_authorizationApi == nil) {
        _authorizationApi = [[AuthorizationApiImpl alloc] initWithApi:[[FloAuthenticationApi alloc] init] ];
    }
    return _authorizationApi;
}

@end
