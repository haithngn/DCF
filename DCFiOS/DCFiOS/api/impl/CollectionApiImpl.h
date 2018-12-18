//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionApi.h"

@class FloCollectionApi;

@interface CollectionApiImpl : NSObject<CollectionApi>
- (instancetype)initWithApi:(FloCollectionApi *)api;


@end