//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "AuthorizeViewController.h"
#import "AuthorizeViewModel.h"
#import "Dependences.h"

@interface AuthorizeViewController ()

@property (nonatomic, strong) AuthorizeViewModel * model;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation AuthorizeViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[AuthorizeViewModel alloc] initWithUserService:[Dependences userService]];

    [self bindData];
}

- (IBAction)signIn:(UIButton *)sender {
    [_model login];
}

- (IBAction)typingUsername:(UITextField *)sender {
    _model.username = sender.text;
}

- (IBAction)typingPassword:(UITextField *)sender {
    _model.password = sender.text;
}

- (void)bindData {
    _model.onError = ^(NSString * message) {
        [self showMessage:message confirmButtonTitle:@"Close" onConfirmed:nil];
    };
}

@end
