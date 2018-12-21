//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol FloItemViewModel;

@protocol FloTableViewDataSource <NSObject>
@required
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath forItem:(NSObject <FloItemViewModel> *)item;
@optional
- (void)didSelect:(NSObject <FloItemViewModel> *)item;

@end

@interface BaseTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) NSObject <FloTableViewDataSource> * delegate;

- (instancetype)initWithDelegate:(NSObject <FloTableViewDataSource> *)delegate;

-(void)load:(NSArray <NSObject <FloItemViewModel>*>*)items;

@end