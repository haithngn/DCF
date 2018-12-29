//
// Created by Hai Nguyen Thanh on 2018-12-29.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReactObserver <NSObject>
- (void)didSubmit:(NSString *)username password:(NSString *)password;
@end

@protocol ReactService <NSObject>
@required
- (void)subscribe:(NSObject <ReactObserver> *)client;

@end