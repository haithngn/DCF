//
// Created by Hai Nguyen on 2018-12-24.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//


#import <AppKit/AppKit.h>

@interface BaseOSXViewController : NSViewController
- (void)showMessage:(NSString *)message confirmButtonTitle:(NSString *)title onConfirmed:(void (^)(void))confirmed;

@end
