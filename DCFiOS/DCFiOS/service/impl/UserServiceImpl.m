//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "UserServiceImpl.h"
#import "AuthorizationApi.h"
#import "BroadcastService.h"

@interface UserServiceImpl ()

@property (nonatomic) NSObject <AuthorizationApi> * authorizeApi;
@property (nonatomic, strong) NSMutableArray <NSObject <AuthenticationObserver> *> * authenticationSubscribers;

@end

@implementation UserServiceImpl {
@private
    NSMutableArray<NSObject <AuthenticationObserver> *> *_authenticationSubscribers;
}

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
        if (user != nil) {
            [self announceAuthenticationChanged:user];
        }
        handler ? handler(user, error) : 0;
    }];
}

- (void)announceAuthenticationChanged:(FloUser *)user {
    [_authenticationSubscribers enumerateObjectsUsingBlock:^(NSObject <AuthenticationObserver> *subcribers, NSUInteger idx, BOOL *stop) {
        [subcribers onChange:user];
    }];
}

- (void)subscribeOnAuthentication:(NSObject <AuthenticationObserver> *)subscriber {
    if ([self.authenticationSubscribers containsObject:subscriber] == NO) {
        [_authenticationSubscribers addObject:subscriber];
    }
}

- (NSMutableArray<NSObject <AuthenticationObserver> *> *)authenticationSubscribers {
    if (_authenticationSubscribers == nil) {
        _authenticationSubscribers = [[NSMutableArray<NSObject <AuthenticationObserver> *> alloc] init];
    }

    return _authenticationSubscribers;
}

@end