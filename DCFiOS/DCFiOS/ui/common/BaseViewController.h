//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)showMessage:(NSString *)message confirmButtonTitle:(NSString *) title onConfirmed:(void(^)())confirmed;

@end