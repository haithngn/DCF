//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>
#import "BaseViewController.h"
#import "Navigator.h"
#import <SVProgressHUD/SVProgressHUD.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@implementation BaseViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupProgressUI];
}

- (void)setupProgressUI {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
}

- (void)showMessage:(NSString *)message confirmButtonTitle:(NSString *) title onConfirmed:(void(^)())confirmed {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"DCFiOS"
                                                                    message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:title != nil ? title : @"Close"
                                              style:UIAlertActionStyleDestructive
                                            handler:^(UIAlertAction *action) {
                                                confirmed ? confirmed : nil;
                                            }] ];
}

- (void)dealloc {
    DDLogDebug(@"%@ dealocing....", THIS_FILE);
}

- (void)showLoading:(NSString *)message {
    [SVProgressHUD showWithStatus:message];
}

- (void)hideLoading {
    [SVProgressHUD dismissWithDelay:.35f];
}

- (void)showError:(NSString *)message {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:message
            preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDestructive
                                                      handler:nil]];
}


@end