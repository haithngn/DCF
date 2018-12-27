//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "RouterImpl.h"
#import "UserService.h"
#import "BroadcastService.h"
#import "OSXStoryboards.h"
#import "MainWindowController.h"
#import "AuthorizeWindowController.h"
#import <AppKit/AppKit.h>

@interface RouterImpl () <AuthenticationObserver>

@property (nonatomic, weak) NSObject <BroadcastService> * broadcastService;
@property (nonatomic, weak) NSObject <UserService> * userService;

@end

@implementation RouterImpl {

}
- (instancetype)initWithBroadcastService:(NSObject <BroadcastService> *)broadcastService userService:(NSObject <UserService> *)userService {
    self = [super init];
    if (self) {
        self.broadcastService = broadcastService;
        self.userService = userService;
        [broadcastService subscribeOnAuthentication:self];
    }

    return self;
}

- (void)reopen {
    if (_userService.currentUserId != nil) {
        MainWindowController * windowController = [[OSXStoryboards main] instantiateControllerWithIdentifier:@"MainWindowController"];
        [windowController showWindow:nil];
        [[windowController window] makeMainWindow];
    }
}

- (void)signOut {
    [_userService logOut];
}

#pragma mark - AuthenticationObserver

- (void)onChange:(FloUser *)user {
    if (user == nil) {
        AuthorizeWindowController * windowController = [[OSXStoryboards main] instantiateControllerWithIdentifier:@"AuthorizeWindowController"];
        [windowController showWindow:nil];
        [[windowController window] makeMainWindow];
    }
}


@end
