//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "AuthorizeOSXViewModel.h"
#import "BroadcastService.h"

@interface AuthorizeOSXViewModel () <AuthenticationObserver>

@property (nonatomic, weak) NSObject <BroadcastService> * broadcastService;

@end

@implementation AuthorizeOSXViewModel {

}
- (instancetype)initWithBroadcastService:(NSObject <BroadcastService> *)broadcastService {
    self = [super init];
    if (self) {
        self.broadcastService = broadcastService;
        [broadcastService subscribeOnAuthentication:self];
    }

    return self;
}

#pragma mark - AuthenticationObserver

- (void)onChange:(FloUser *)user {
    if (user != nil) {
        _onAuthorize ? _onAuthorize() : nil;
    } else {
        _onUnauthorize ? _onUnauthorize() : nil;
    }
}


@end
