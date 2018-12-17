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

    _model = [[BootstrapViewModel alloc] initWithBroadcastService:[Dependences broadcastService]];

    [self bindData];
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
    AuthorizeViewController * controller = [[Storyboards main] instantiateViewControllerWithIdentifier:@"AuthorizeViewController"];
    self.viewControllers = @[controller];
}

- (void)navigateToMainScreen {
    MainViewController * controller = [[Storyboards main] instantiateViewControllerWithIdentifier:@"MainViewController"];
    self.viewControllers = @[controller];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
