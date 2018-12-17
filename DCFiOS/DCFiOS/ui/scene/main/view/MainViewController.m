//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "Storyboards.h"
#import "NavigationsViewController.h"


@implementation MainViewController {

}

- (instancetype)init {
    if (self = [super init]) {
        HomeViewController * home = [[Storyboards main] instantiateViewControllerWithIdentifier:@"HomeViewController"];
        self.rootViewController = [[UINavigationController alloc] initWithRootViewController:home];

        NavigationsViewController * left = [[Storyboards main] instantiateViewControllerWithIdentifier:@"NavigationsViewController"];
        self.leftViewController = [[UINavigationController alloc] initWithRootViewController:left];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end