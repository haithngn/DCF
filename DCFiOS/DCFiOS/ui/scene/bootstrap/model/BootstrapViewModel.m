//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BootstrapViewModel.h"
#import "UserService.h"

@interface BootstrapViewModel ()

@property (nonatomic, weak) NSObject <BroadcastService> * broadcastService;
@property (nonatomic, weak) NSObject <UserService> * userService;

@end

@implementation BootstrapViewModel {

}

- (instancetype)initWithBroadcastService:(NSObject <BroadcastService> *)broadcastService userService:(NSObject <UserService> *)userService{
    self = [super init];
    if (self) {
        self.broadcastService = broadcastService;
        self.userService = userService;
        [_broadcastService subscribeOnAuthentication:self];
    }

    return self;
}

- (void)autoLogin {
    if (_userService.currentUserId != nil){
        [_userService autoLogin];
    } else {
        _onSignedOut ? _onSignedOut() : nil;
    }
}

#pragma mark - BroadcastService Methods
- (void)onChange:(FloUser *)user {
    if (user == nil) {
        _onSignedOut ? _onSignedOut() : nil;
    } else {
        _onSignedIn ? _onSignedIn() : nil;
    }
}

@end
