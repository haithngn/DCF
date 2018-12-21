//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CollectionItemViewModel;


@interface CollectionViewDataSource : NSObject
- (void)load:(NSArray<CollectionItemViewModel *> *)items;
@end