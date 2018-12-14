//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "UserServiceImpl.h"
#import "AuthorizationApi.h"

@interface UserServiceImpl ()

@property (nonatomic) NSObject <AuthorizationApi> * authorizeApi;

@end

@implementation UserServiceImpl

- (instancetype)initWithAuthorizeApi:(NSObject <AuthorizationApi> *)authorizeApi {
    self = [super init];
    if (self) {
        self.authorizeApi = authorizeApi;
    }

    return self;
}

+ (instancetype)serviceWithAuthorizeApi:(NSObject <AuthorizationApi> *)authorizeApi {
    return [[self alloc] initWithAuthorizeApi:authorizeApi];
}


- (void)signIn:(LoginParameter *)params complete:(void (^)(FloUser *user, NSError *error))handler {
    [_authorizeApi signIn: params complete:^(FloUser * user, Credentials * credentials, NSError * error){
        handler ? handler(user, error) : 0;
    }];
}

@end