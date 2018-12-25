//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionsOSXViewController.h"
#import "CollectionsViewModel.h"
#import "Dependences.h"
#import "BaseOSXTableViewDataSource.h"
#import "CollectionsViewCell.h"
#import "MainOSXViewController.h"
#import "FloItemViewModel.h"
#import "KanbansViewController.h"
#import "OSXStoryboards.h"

@interface CollectionsOSXViewController () <FloOSXTableViewDataSource>

@property (nonatomic, weak) IBOutlet NSTableView * tableView;
@property (nonatomic, strong) CollectionsViewModel * model;
@property (nonatomic, strong) BaseOSXTableViewDataSource * datasource;

@end

@implementation CollectionsOSXViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [[CollectionsViewModel alloc] initWithCollectionService:[Dependences collectionService]];
    _datasource = [[BaseOSXTableViewDataSource alloc] initWithDelegate:self];
    _tableView.dataSource = _datasource;
    _tableView.delegate = _datasource;

    [self bindData];

    [_model load];
}

- (void)bindData {
    __weak typeof(self) weakSelf = self;
    _model.onProjects = ^(NSArray <ProjectItemViewModel> * items){
        [weakSelf.datasource load:items];
        [weakSelf.tableView reloadData];
    };
}

#pragma mark -

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row forItem:(NSObject <FloItemViewModel> *)item {
    CollectionsViewCell * cell = [tableView makeViewWithIdentifier:@"CollectionsViewCell" owner:nil];
    cell.model = item;

    return cell;
}

- (void)didSelect:(NSObject <FloItemViewModel> *)item {
    if ([_delegate respondsToSelector:@selector(openCollection:)]) {
        [_delegate openCollection:item.objectId];
    }
}

- (NSInteger)selectedIndex {
    return _tableView.selectedRow;
}

@end
