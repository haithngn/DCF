//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionService.h"

@protocol CollectionApi;

@interface CollectionServiceImpl : NSObject <CollectionService>
- (instancetype)initWithCollectionApi:(NSObject <CollectionApi> *)collectionApi;

@end