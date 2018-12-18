//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionsViewController.h"
#import "CollectionsViewModel.h"
#import "Dependences.h"

@interface CollectionsViewController ()

@property (nonatomic, strong) CollectionsViewModel * model;

@end

@implementation CollectionsViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[CollectionsViewModel alloc] initWithCollectionService:[Dependences collectionService]];

    [self bindData];

    [_model load];
}

- (void)bindData {

}

@end