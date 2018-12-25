//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface AuthorizeInputViewModel : NSObject <NSTextFieldDelegate>

@property(nonatomic, copy) void (^onChange)(NSString *);

@end
