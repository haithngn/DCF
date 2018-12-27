//
// Created by Hai Nguyen on 2018-12-24.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BaseOSXViewController.h"


@implementation BaseOSXViewController {

}
- (void)showMessage:(NSString *)message confirmButtonTitle:(NSString *)title onConfirmed:(void (^)(void))confirmed {
    NSAlert * alert = [[NSAlert alloc] init];
    alert.messageText = message;
    [alert addButtonWithTitle:title];
    [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
        confirmed ? confirmed() : nil;
    }];
}

@end
