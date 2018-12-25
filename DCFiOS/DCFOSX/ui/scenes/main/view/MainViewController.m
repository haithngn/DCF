//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "MainViewController.h"
#import "AuthorizeOSXViewModel.h"
#import "Dependences.h"

@interface MainViewController ()

@property (nonatomic, strong) AuthorizeOSXViewModel * authorizeModel;

@end

@implementation MainViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _authorizeModel = [[AuthorizeOSXViewModel alloc] initWithBroadcastService:[Dependences broadcastService]];

    [self bindData];
}

- (void)bindData {
    __weak typeof(self) weakSelf = self;
    _authorizeModel.onUnauthorize = ^(){
        [weakSelf.view.window close];
    };
}

@end