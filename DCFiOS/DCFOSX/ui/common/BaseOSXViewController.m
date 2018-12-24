//
// Created by Hai Nguyen on 2018-12-24.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BaseOSXViewController.h"


@implementation BaseOSXViewController {

}
- (void)showMessage:(NSString *)message confirmButtonTitle:(NSString *)title onConfirmed:(void (^)())confirmed {
    NSLog(@"showMessage: %@", message);
}

@end
