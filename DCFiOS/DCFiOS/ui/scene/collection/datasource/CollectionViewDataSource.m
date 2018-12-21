//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionViewDataSource.h"
#import "CollectionItemViewModel.h"

@interface CollectionViewDataSource ()

@property (nonatomic, strong) NSArray<CollectionItemViewModel *> * items;

@end

@implementation CollectionViewDataSource {

@private
    NSArray<CollectionItemViewModel *> *_items;
}

@synthesize items = _items;

- (void)load:(NSArray<CollectionItemViewModel *> *)items {
    self.items = items;
}

- (NSArray<CollectionItemViewModel *> *)items {
    if (_items == nil) {
        _items = [[NSArray<CollectionItemViewModel *> alloc] init];
    }

    return _items;
}


@end