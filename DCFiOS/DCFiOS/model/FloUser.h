//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FloUser : NSObject

@property (nonatomic, readonly) NSString * id;

- (instancetype)initWithId:(NSString *)id;

+ (instancetype)userWithId:(NSString *)id;


@end