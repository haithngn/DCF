//
// Created by Hai Nguyen on 2018-12-24.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "AuthorizeOSXViewController.h"
#import "AuthorizeViewModel.h"
#import "Dependences.h"
#import "BaseOSXViewController.h"
#import "AuthorizeInputViewModel.h"
#import "AuthorizeOSXViewModel.h"

@interface AuthorizeOSXViewController ()
@property (weak) IBOutlet NSTextField *usernameTextField;
@property (weak) IBOutlet NSTextField *passwordTextField;
@property (weak) IBOutlet NSButton *submitButton;
@property (nonatomic, strong) AuthorizeViewModel * model;
@property (nonatomic, strong) AuthorizeOSXViewModel * authorizeModel;
@property (nonatomic, strong) AuthorizeInputViewModel * inputUsrModel;
@property (nonatomic, strong) AuthorizeInputViewModel * inputPwdModel;

@end

@implementation AuthorizeOSXViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[AuthorizeViewModel alloc] initWithUserService:[Dependences userService]];
    _authorizeModel = [[AuthorizeOSXViewModel alloc] initWithBroadcastService:[Dependences broadcastService]];

    _inputUsrModel = [AuthorizeInputViewModel new];
    _inputPwdModel = [AuthorizeInputViewModel new];

    [self bindData];
}

- (void)bindData {
    _usernameTextField.delegate = _inputUsrModel;
    _passwordTextField.delegate = _inputPwdModel;

    __weak typeof(self) weakSelf = self;
    _model.onError = ^(NSString * message) {
        [weakSelf showMessage:message confirmButtonTitle:@"Close" onConfirmed:nil];
    };

    _inputUsrModel.onChange = ^(NSString * _Nonnull text){
        weakSelf.model.username = text;
    };

    _inputPwdModel.onChange = ^(NSString * _Nonnull text){
        weakSelf.model.password = text;
    };
    
    _authorizeModel.onAuthorize = ^(void){
        [weakSelf.view.window close];
    };
}

- (IBAction)signIn:(NSButton *)sender {
    [_model login];
}

@end
