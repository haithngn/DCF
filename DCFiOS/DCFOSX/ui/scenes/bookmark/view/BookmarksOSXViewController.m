//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarksOSXViewController.h"
#import "BookmarksViewModel.h"
#import "BaseOSXTableViewDataSource.h"
#import "Dependences.h"
#import "BookmarksViewCell.h"
#import "FloItemViewModel.h"
#import "BookmarkOSXViewController.h"
#import "OSXStoryboards.h"

@interface BookmarksOSXViewController () <FloOSXTableViewDataSource>

@property (nonatomic, weak) IBOutlet NSTableView * tableView;
@property (nonatomic, strong) BookmarksViewModel * model;
@property (nonatomic, strong) BaseOSXTableViewDataSource * datasource;

@end

@implementation BookmarksOSXViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _datasource = [[BaseOSXTableViewDataSource alloc] initWithDelegate:self];
    _tableView.dataSource = _datasource;
    _tableView.delegate = _datasource;
}

#pragma mark -

- (void)setKanbanId:(NSString *)kanbanId {
    _kanbanId = [kanbanId mutableCopy];
    _model = [[BookmarksViewModel alloc] initWithKanbanId:kanbanId userService:[Dependences userService]
            bookmarkService:[Dependences bookmarkService]];
    [self bindData];
    [_model load];
}


- (void)bindData {
    __weak typeof(self) weakSelf = self;
    _model.onItems = ^(NSArray <NSObject<FloItemViewModel> *> * items){
        [weakSelf.datasource load:items];
        [weakSelf.tableView reloadData];
    };

    _model.onError = ^(NSString * message){
        [weakSelf showMessage:message confirmButtonTitle:@"Close" onConfirmed:nil];
    };
}

#pragma mark -

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row forItem:(NSObject <FloItemViewModel> *)item {
    BookmarksViewCell * cell = [tableView makeViewWithIdentifier:@"BookmarksViewCell" owner:nil];
    cell.model = item;

    return cell;
}

- (void)didSelect:(NSObject <FloItemViewModel> *)item {
    BookmarkOSXViewController * bookmarkOSXViewController = [[OSXStoryboards main] instantiateControllerWithIdentifier:@"BookmarkOSXViewController"];
    bookmarkOSXViewController.bookmarkId = item.objectId;

    [self presentViewControllerAsModalWindow:bookmarkOSXViewController];
}

- (NSInteger)selectedIndex {
    return _tableView.selectedRow;
}

@end