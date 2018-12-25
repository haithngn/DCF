//
//  AppDelegate.m
//  DCFOSX
//
//  Created by Hai Nguyen Thanh on 12/23/18.
//  Copyright © 2018 Hai Nguyen. All rights reserved.
//

#import "AppDelegate.h"
#import "Router.h"
#import "RouterImpl.h"
#import "Dependences.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSObject <Router> * router;

@end

@implementation AppDelegate {
@private
    NSObject <Router> *_router;
}

@synthesize router = _router;

- (IBAction)signOut:(NSMenuItem *)sender {
    [self.router signOut];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
    BOOL result = NO;
    if (flag == NO) {
        [self.router reopen];
        result = YES;
    }
    return result;
}

#pragma mark -

- (NSObject <Router>*)router {
    if (_router == nil) {
        _router = [[RouterImpl alloc] initWithBroadcastService:[Dependences broadcastService]
                userService:[Dependences userService]];
    }

    return _router;
}

@end
