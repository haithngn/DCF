//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FloKanban : NSObject

@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * name;

- (instancetype)initWithId:(NSString *)id name:(NSString *)name;


@end