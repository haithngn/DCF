//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Navigator.h"

@interface BaseViewController : UIViewController
@property (nonatomic, strong) NSObject <Navigator> * navigator;
- (void)showMessage:(NSString *)message confirmButtonTitle:(NSString *) title onConfirmed:(void(^)())confirmed;
- (void)showLoading:(NSString *)message;
- (void)hideLoading;
- (void)showError:(NSString *) message;

@end