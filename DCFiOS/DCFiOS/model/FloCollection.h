//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FloCollection : NSObject
@property (nonatomic, copy) NSString * collectionId;
@property (nonatomic, copy) NSString * collectionName;

- (instancetype)initWithCollectionId:(NSString *)collectionId collectionName:(NSString *)collectionName;

@end