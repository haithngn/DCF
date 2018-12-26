//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarksViewController.h"
#import "BaseTableViewDataSource.h"
#import "BookmarksViewModel.h"
#import "Dependences.h"
#import "BookmarksViewCell.h"

@interface BookmarksViewController () <FloTableViewDataSource>

@property (nonatomic, strong) BookmarksViewModel * model;
@property (nonatomic, strong) BaseTableViewDataSource * datasource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BookmarksViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[BookmarksViewModel alloc] initWithKanbanId:_collectionId
                                              userService:[Dependences userService] bookmarkService:[Dependences bookmarkService]];
    _datasource = [[BaseTableViewDataSource alloc] initWithDelegate:self];
    _tableView.dataSource = _datasource;
    _tableView.delegate = _datasource;

    [self bindData];

    [_model load];
}

- (void)bindData {

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath forItem:(NSObject <FloItemViewModel> *)item {
    BookmarksViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BookmarksViewCell" forIndexPath:indexPath];

    return cell;
}

- (void)didSelect:(NSObject <FloItemViewModel> *)item {

}


@end