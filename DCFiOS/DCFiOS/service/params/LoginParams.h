//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginParams : NSObject

@property (nonatomic, readonly) NSString * username;
@property (nonatomic, readonly) NSString * password;

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;


@end