//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "MainOSXViewController.h"
#import "AuthorizeOSXViewModel.h"
#import "Dependences.h"
#import "CollectionsOSXViewController.h"
#import "KanbansViewController.h"
#import "MainViewModel.h"

FOUNDATION_EXPORT NSString *const kCollectionsSegueID;
FOUNDATION_EXPORT NSString *const kKanbansSegueID;
FOUNDATION_EXPORT NSString *const kBookmarksSegueID;

NSString *const kCollectionsSegueID = @"container.collections.view";
NSString *const kKanbansSegueID = @"container.kanbans.view";
NSString *const kBookmarksSegueID = @"kBookmarksSegueID";

@interface MainOSXViewController () <CollectionsViewDelegate>

@property (nonatomic, strong) AuthorizeOSXViewModel * authorizeModel;
@property (nonatomic, strong) KanbansViewController * kanbansController;
@property (nonatomic, strong) MainViewModel * model;

@end

@implementation MainOSXViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    _authorizeModel = [[AuthorizeOSXViewModel alloc] initWithBroadcastService:[Dependences broadcastService]];
    _model = [[MainViewModel alloc] init];

    [self bindData];
}

- (void)bindData {
    __weak typeof(self) weakSelf = self;
    _authorizeModel.onUnauthorize = ^(){
        [weakSelf.view.window close];
    };

    _model.onOpenCollection = ^(NSString * collectionId){
        weakSelf.kanbansController.collectionId = collectionId;
    };
}

#pragma mark - Collections View Delegate

- (void)openCollection:(NSString *)collectionId {
    [_model openCollection:collectionId];
}


#pragma mark - Construction

- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(nullable id)sender {
    [super prepareForSegue:segue sender:sender];

    if ([segue.identifier isEqualToString:kCollectionsSegueID]) {
        CollectionsOSXViewController * controller = (CollectionsOSXViewController*)segue.destinationController;
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:kKanbansSegueID]) {
        self.kanbansController = (KanbansViewController*)segue.destinationController;
    } else if ([segue.identifier isEqualToString:kBookmarksSegueID]) {

    }
}

@end
