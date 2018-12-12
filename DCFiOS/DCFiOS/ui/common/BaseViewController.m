//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end