//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@protocol FloItemViewModel;

@protocol FloOSXTableViewDataSource <NSObject>
@required
- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row forItem:(NSObject <FloItemViewModel> *)item;

@optional
- (void)didSelect:(NSObject <FloItemViewModel> *)item;
- (NSInteger)selectedIndex;

@end

@interface BaseOSXTableViewDataSource : NSObject <NSTableViewDataSource, NSTableViewDelegate>
@property (nonatomic, weak) NSObject <FloOSXTableViewDataSource> * delegate;

- (instancetype)initWithDelegate:(NSObject <FloOSXTableViewDataSource> *)delegate;

-(void)load:(NSArray <NSObject <FloItemViewModel>*>*)items;

@end
