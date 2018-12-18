//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FloCollection;

@protocol CollectionService <NSObject>
- (void)findAll:(void (^)(NSArray<FloCollection *> * collections, NSError * error))handler;

@end