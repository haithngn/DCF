//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BaseTableViewDataSource.h"

@interface BaseTableViewDataSource ()

@property (nonatomic) NSMutableArray <NSObject <FloItemViewModel>*> * items;

@end

@implementation BaseTableViewDataSource {

@private
    NSMutableArray<NSObject <FloItemViewModel> *> *_items;
}

@synthesize items = _items;

- (instancetype)initWithDelegate:(NSObject <FloTableViewDataSource> *)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }

    return self;
}

- (NSMutableArray<NSObject <FloItemViewModel> *> *)items {
    if (_items == nil) {
        _items = [[NSMutableArray<NSObject <FloItemViewModel>*> alloc] init];
    }

    return _items;
}

#pragma mark - UITableView Data Source * Delegate Methods

- (void)load:(NSArray <NSObject <FloItemViewModel> *> *)items {
    self.items = items;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [_delegate tableView:tableView
            cellForRowAtIndexPath:indexPath forItem:_items[indexPath.row]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_delegate didSelect:_items[indexPath.row]];
}

@end