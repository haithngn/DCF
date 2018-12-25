//
// Created by Hai Nguyen on 2018-12-24.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BootstrapWindowController.h"
#import "BootstrapViewModel.h"
#import "Dependences.h"
#import "AuthorizeWindowController.h"
#import "OSXStoryboards.h"
#import "MainWindowController.h"

@interface BootstrapWindowController ()

@property (nonatomic, strong) BootstrapViewModel * model;

@end

@implementation BootstrapWindowController {

}
- (void)windowDidLoad {
    [super windowDidLoad];

    _model = [[BootstrapViewModel alloc] initWithBroadcastService:[Dependences broadcastService] userService:[Dependences userService]];

    [self bindData];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.0f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [_model autoLogin];
    });
}

- (void)bindData {
    _model.onSignedIn = ^(){
        [self navigateToMainScreen];
    };
    _model.onSignedOut = ^(){
        [self navigateToAuthorizeScreen];
    };
}

- (void)navigateToAuthorizeScreen {
    [self close];

    AuthorizeWindowController * windowController = [[OSXStoryboards main] instantiateControllerWithIdentifier:@"AuthorizeWindowController"];
    [windowController showWindow:nil];
    [[windowController window] makeMainWindow];
}

- (void)navigateToMainScreen {
    [self close];
    MainWindowController * windowController = [[OSXStoryboards main] instantiateControllerWithIdentifier:@"MainWindowController"];
    [windowController showWindow:nil];
    [[windowController window] makeMainWindow];
}

@end
