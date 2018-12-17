//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "NavigationsViewController.h"
#import "NavigationsViewModel.h"
#import "Dependences.h"

@interface NavigationsViewController ()

@property (nonatomic, strong) NavigationsViewModel * model;

@end

@implementation NavigationsViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[NavigationsViewModel alloc] initWithUserService:[Dependences userService]];
}
- (IBAction)signOut:(id)sender {
    [_model signOut];
}

@end
