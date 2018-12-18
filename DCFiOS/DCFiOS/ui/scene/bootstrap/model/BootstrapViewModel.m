//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BootstrapViewModel.h"

@interface BootstrapViewModel ()

@property (nonatomic, weak) NSObject <BroadcastService> * broadcastService;

@end

@implementation BootstrapViewModel {

}

- (instancetype)initWithBroadcastService:(NSObject <BroadcastService> *)broadcastService {
    self = [super init];
    if (self) {
        self.broadcastService = broadcastService;
        [_broadcastService subscribeOnAuthentication:self];
    }

    return self;
}


#pragma mark - BroadcastService Methods
- (void)onChange:(User *)user {
    if (user == nil) {
        _onSignedOut ? _onSignedOut() : nil;
    } else {
        _onSignedIn ? _onSignedIn() : nil;
    }
}

@end