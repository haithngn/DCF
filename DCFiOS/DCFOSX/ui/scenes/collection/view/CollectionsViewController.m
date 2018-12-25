//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionsViewController.h"
#import "CollectionsViewModel.h"
#import "Dependences.h"
#import "BaseOSXTableViewDataSource.h"
#import "CollectionsViewCell.h"
#import "FloItemViewModel.h"

@interface CollectionsViewController () <FloOSXTableViewDataSource>

@property (nonatomic, weak) NSTableView * tableView;
@property (nonatomic, strong) CollectionsViewModel * model;
@property (nonatomic, strong) BaseOSXTableViewDataSource * datasource;

@end

@implementation CollectionsViewController {

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
    NSLog(@"Selected : %@", item.title);
}

- (NSInteger)selectedIndex {
    return _tableView.selectedRow;
}

@end
