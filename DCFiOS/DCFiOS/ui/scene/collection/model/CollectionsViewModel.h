//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@protocol CollectionService;


@interface CollectionsViewModel : BaseViewModel
- (instancetype)initWithCollectionService:(NSObject <CollectionService> *)collectionService;

- (void)load;

@end