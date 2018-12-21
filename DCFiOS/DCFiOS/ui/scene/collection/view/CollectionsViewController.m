//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionsViewController.h"
#import "CollectionsViewModel.h"
#import "Dependences.h"
#import "CollectionsViewDataSource.h"
#import "BaseTableViewDataSource.h"
#import "CollectionsItemViewCell.h"
#import "KanbanNavigations.h"

@interface CollectionsViewController () <FloTableViewDataSource>

@property (nonatomic, strong) CollectionsViewModel * model;
@property (nonatomic, strong) BaseTableViewDataSource * datasource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CollectionsViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[CollectionsViewModel alloc] initWithCollectionService:[Dependences collectionService]];
    _datasource = [[BaseTableViewDataSource alloc] initWithDelegate:self];
    _tableView.dataSource = _datasource;
    _tableView.delegate = _datasource;

    [self bindData];

    [_model load];
}

- (void)bindData {
    __weak typeof(self) weakSelf = self;
    _model.onProjects = ^(NSArray <ProjectItemViewModel>* items){
        [weakSelf.datasource load:items];
        [weakSelf.tableView reloadData];
    };

    _model.onSelect = ^(NSString * collectionId){
        [weakSelf.kanbanNavigations loadCollectionWithId:collectionId];
    };

    _model.onPreventInteractions = ^(BOOL prevent){
        if (prevent == YES){
            [weakSelf showLoading:@"loading..."];
        } else {
            [weakSelf hideLoading];
        }
    };
}

#pragma mark - BaseTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath forItem:(NSObject <FloItemViewModel> *)item {
    CollectionsItemViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionsItemViewCell" forIndexPath:indexPath];
    cell.model = item;
    return cell;
}

- (void)didSelect:(NSObject <FloItemViewModel> *)item {
    [_model select:item];
}


@end
