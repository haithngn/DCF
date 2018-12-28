//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BroadcastServiceImpl.h"
#import "UserService.h"

@interface BroadcastServiceImpl () <AuthenticationObserver>

@property (nonatomic, strong) NSMutableArray <NSObject <AuthenticationObserver> *> * authenticationSubscribers;
@property (nonatomic, strong) NSObject <UserService> * userService;

@end

@implementation BroadcastServiceImpl {
@private
    NSMutableArray<NSObject <AuthenticationObserver> *> *_authenticationSubscribers;
    NSObject <UserService> *_userService;
}

@synthesize authenticationSubscribers = _authenticationSubscribers;
@synthesize userService = _userService;

- (instancetype)initWithersUserService:(NSObject <UserService> *)userService {
    self = [super init];
    if (self) {
        self.userService = userService;
        [_userService subscribeOnAuthentication:self];
    }

    return self;
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

#pragma mark - AuthenticationObserver
- (void)onChange:(User *)user {
    [_authenticationSubscribers enumerateObjectsUsingBlock:^(NSObject <AuthenticationObserver> *subscriber, NSUInteger idx, BOOL *stop) {
        [subscriber onChange:user];
    }];
}


@end