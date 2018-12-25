//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "AuthorizeInputViewModel.h"


@implementation AuthorizeInputViewModel {

}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    NSString * value = textField.stringValue;
    if (value != nil) {
        _onChange ? _onChange(value) : nil;
    }
}

@end