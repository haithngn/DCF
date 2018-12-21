//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "NavigationsViewController.h"
#import "NavigationsViewModel.h"
#import "Dependences.h"
#import "BaseTableViewDataSource.h"
#import "KanbanViewCell.h"
#import "KanbanNavigations.h"

@interface NavigationsViewController () <FloTableViewDataSource>

@property (nonatomic, strong) NavigationsViewModel * model;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) BaseTableViewDataSource * dataSource;

@end

@implementation NavigationsViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[NavigationsViewModel alloc] initWithKanbanService:[Dependences kanbanService] userService:[Dependences userService]];
    _dataSource = [[BaseTableViewDataSource alloc] initWithDelegate:self];
    _tableView.dataSource = _dataSource;
    _tableView.delegate = _dataSource;

    [self bindData];
}

- (void)bindData {
    _model.onKanbans = ^(NSArray <NSObject <FloItemViewModel> *>* items){
        [self.dataSource load:items];
        [self.tableView reloadData];
    };

    _model.onSelectKanban = ^(NSString * kanbanId){
        [self.delegate didSelectKanbanWithId:kanbanId];
    };
}

- (IBAction)signOut:(id)sender {
    [_model signOut];
}

#pragma mark -

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath forItem:(NSObject <FloItemViewModel> *)item {
    KanbanViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"KanbanViewCell" forIndexPath:indexPath];
    cell.model = item;
    return cell;
}

- (void)didSelect:(NSObject <FloItemViewModel> *)item {
    [_model select:item];
}

- (void)loadCollectionWithId:(NSString *)collectionId {
    _model.collectionId = collectionId;
}


@end
