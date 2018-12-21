//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionsViewDataSource.h"

@class ProjectItemViewModel;

@interface CollectionsViewDataSource ()

@property (nonatomic) NSMutableArray <ProjectItemViewModel*> * items;

@end

@implementation CollectionsViewDataSource {

@private
    NSMutableArray<ProjectItemViewModel *> *_items;
}

@synthesize items = _items;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark -

- (NSMutableArray<ProjectItemViewModel *> *)items {
    if (_items == nil) {
        _items = [[NSMutableArray<ProjectItemViewModel*> alloc] init];
    }

    return _items;
}


@end