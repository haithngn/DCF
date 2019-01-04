//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "KanbansViewController.h"
#import "BaseOSXTableViewDataSource.h"
#import "KanbansViewModel.h"
#import "KanbansViewCell.h"
#import "Dependences.h"
#import "FloItemViewModel.h"
#import "MainOSXViewController.h"

@interface KanbansViewController () <FloOSXTableViewDataSource>

@property (nonatomic, weak) IBOutlet NSTableView * tableView;
@property (nonatomic, strong) KanbansViewModel * model;
@property (nonatomic, strong) BaseOSXTableViewDataSource * datasource;

@end

@implementation KanbansViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _datasource = [[BaseOSXTableViewDataSource alloc] initWithDelegate:self];
    _tableView.dataSource = _datasource;
    _tableView.delegate = _datasource;
}

#pragma mark -

- (void)setCollectionId:(NSString *)collectionId {
    _collectionId = [collectionId mutableCopy];
    _model = [[KanbansViewModel alloc] initWithKanbanService:[Dependences kanbanService] userService:[Dependences userService]
            collectionId:_collectionId];
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
    KanbansViewCell * cell = [tableView makeViewWithIdentifier:@"KanbansViewCell" owner:nil];
    cell.model = item;

    return cell;
}

- (void)didSelect:(NSObject <FloItemViewModel> *)item {
    if ([_delegate respondsToSelector:@selector(openKanban:)]) {
        [_delegate openKanban:item.objectId];
    }
}

- (NSInteger)selectedIndex {
    return _tableView.selectedRow;
}
@end