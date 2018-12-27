//
//  BootstrapViewController.m
//  DCFiOS
//
//  Created by Hai Nguyen on 12/12/18.
//  Copyright © 2018 Hai Nguyen. All rights reserved.
//

#import "BootstrapViewController.h"
#import "BootstrapViewModel.h"
#import "Dependences.h"
#import "Storyboards.h"
#import "AuthorizeViewController.h"
#import "MainViewController.h"

@interface BootstrapViewController ()

@property (nonatomic, strong) BootstrapViewModel * model;

@end

@implementation BootstrapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _model = [[BootstrapViewModel alloc] initWithBroadcastService:[Dependences broadcastService] userService:[Dependences userService]];

    [self bindData];
    [_model autoLogin];
}

- (void)bindData {
    __weak typeof(self) weakSelf = self;
    _model.onSignedIn = ^(){
        [weakSelf navigateToMainScreen];
    };
    _model.onSignedOut = ^(){
        [weakSelf navigateToAuthorizeScreen];
    };
}

- (void)navigateToAuthorizeScreen {
    AuthorizeViewController * controller = [[Storyboards main] instantiateViewControllerWithIdentifier:@"AuthorizeViewController"];
    self.viewControllers = @[controller];
}

- (void)navigateToMainScreen {
    MainViewController * controller = [[MainViewController alloc] init];
    self.viewControllers = @[controller];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
