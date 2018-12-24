//
// Created by Hai Nguyen on 2018-12-24.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BootstrapViewController.h"
#import "BootstrapViewModel.h"
#import "Dependences.h"

@interface BootstrapViewController ()

@property (nonatomic, strong) BootstrapViewModel * model;

@end

@implementation BootstrapViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[BootstrapViewModel alloc] initWithBroadcastService:[Dependences broadcastService] userService:[Dependences userService]];

    [self bindData];
    [_model autoLogin];
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
    NSLog(@"navigateToAuthorizeScreen");
}

- (void)navigateToMainScreen {
    NSLog(@"navigateToMainScreen");
}

@end
