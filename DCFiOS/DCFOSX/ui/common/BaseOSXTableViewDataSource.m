//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BaseOSXTableViewDataSource.h"

@interface BaseOSXTableViewDataSource ()

@property (nonatomic, strong) NSMutableArray <NSObject <FloItemViewModel> *> * items;

@end

@implementation BaseOSXTableViewDataSource {

@private
    NSMutableArray<NSObject <FloItemViewModel> *> *_items;
}
@synthesize items = _items;

- (instancetype)initWithDelegate:(NSObject <FloOSXTableViewDataSource> *)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }

    return self;
}


- (void)load:(NSArray <NSObject <FloItemViewModel> *> *)items {
    [self.items setArray:items];
}

#pragma mark - NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.items.count;
}

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    return [_delegate tableView:tableView viewForTableColumn:tableColumn row:row forItem:self.items[row]];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    if ([_delegate respondsToSelector:@selector(selectedIndex)]) {
        NSInteger index = [_delegate selectedIndex];
        if (index < self.items.count) {
            if ([_delegate respondsToSelector:@selector(didSelect:)]) {
                [_delegate didSelect:self.items[index]];
            }
        }
    }
}


#pragma mark -

- (NSMutableArray <NSObject <FloItemViewModel> *> *)items {
    if (_items == nil) {
        _items = [[NSMutableArray <NSObject <FloItemViewModel> *> alloc] init];
    }

    return _items;
}

@end
