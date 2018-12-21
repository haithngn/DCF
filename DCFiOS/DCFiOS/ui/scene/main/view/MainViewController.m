//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "MainViewController.h"
#import "Storyboards.h"
#import "KanbanNavigations.h"
#import "NavigationsViewController.h"
#import "CollectionsViewController.h"
#import "NavigatorImpl.h"
#import "CollectionViewController.h"


@class CollectionViewController;

@implementation MainViewController {

}

- (instancetype)init {
    if (self = [super init]) {
        CollectionsViewController * home = [[Storyboards main] instantiateViewControllerWithIdentifier:@"CollectionsViewController"];
        UINavigationController * homeNavVC = [[UINavigationController alloc] initWithRootViewController:home];
        self.rootViewController = homeNavVC;
        home.navigator = [[NavigatorImpl alloc] initWithNavigationController:homeNavVC storyboard:[Storyboards main]];

        NavigationsViewController * left = [[Storyboards main] instantiateViewControllerWithIdentifier:@"NavigationsViewController"];
        self.leftViewController = [[UINavigationController alloc] initWithRootViewController:left];

        home.kanbanNavigations = left;
        left.delegate = self;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didSelectKanbanWithId:(NSString *_Nonnull)kanbanId {
    [self hideLeftView];
    UINavigationController * centerNavVC = (UINavigationController*)self.rootViewController;
    if (centerNavVC != nil) {
        CollectionViewController * controller = [[Storyboards main] instantiateViewControllerWithIdentifier:@"CollectionViewController"];
        [centerNavVC pushViewController:controller animated:true];
        controller.navigator = [[NavigatorImpl alloc] initWithNavigationController:centerNavVC storyboard:[Storyboards main]];
    } else {
        //TODO: present the kanban item by another way
    }
}


@end
