//
// Created by Hai Nguyen on 2018-12-24.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "AuthorizeViewController.h"
#import "AuthorizeViewModel.h"
#import "Dependences.h"
#import "BaseOSXViewController.h"

@interface AuthorizeViewController ()
@property (weak) IBOutlet NSTextField *usernameTextField;
@property (weak) IBOutlet NSTextField *passwordTextField;
@property (weak) IBOutlet NSButton *submitButton;
@property (nonatomic, strong) AuthorizeViewModel * model;

@end

@implementation AuthorizeViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [[AuthorizeViewModel alloc] initWithUserService:[Dependences userService]];

    [self bindData];
}

- (IBAction)typingUsername:(NSTextField *)sender {
    _model.username = sender.stringValue;
}

- (IBAction)typingPassword:(NSTextField *)sender {
    _model.password = sender.stringValue;
}

- (void)bindData {
    _model.onError = ^(NSString * message) {
        [self showMessage:message confirmButtonTitle:@"Close" onConfirmed:nil];
    };
}

- (IBAction)signIn:(NSButton *)sender {
    [_model login];
}

#pragma mark - NSTextField Notification

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    NSLog(@"controlTextDidChange: stringValue == %@", [textField stringValue]);
}

@end
