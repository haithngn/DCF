//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewDataSource.h"
#import "CollectionItemViewModel.h"
#import "CollectionViewModel.h"
#import "Dependences.h"

@interface CollectionViewController ()

@property (nonatomic, strong) CollectionViewDataSource * datasource;
@property (nonatomic, strong) CollectionViewModel * model;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CollectionViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    _datasource = [[CollectionViewDataSource alloc] init];
    _model = [[CollectionViewModel alloc] initWithKanbanService:[Dependences kanbanService] userService:[Dependences userService] collectionId:_collectionId];
    [self bindData];
    [self bindEvents];

    _model.selectKanbanAtIndex = 0;
}

- (void)bindEvents {

}

- (void)bindData {
    __weak typeof(self) weakSelf = self;
    _model.onItems = ^(NSArray <CollectionItemViewModel*> * items) {
        [weakSelf.datasource load:items];
        [weakSelf.tableView reloadData];
    };
}

@end
