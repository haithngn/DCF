//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigatorImpl.h"
#import "CollectionViewController.h"

@interface NavigatorImpl ()

@property (nonatomic) UINavigationController * navigationController;
@property (nonatomic) UIStoryboard * storyboard;

@end

@implementation NavigatorImpl {

}
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController storyboard:(UIStoryboard *)storyboard {
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
        self.storyboard = storyboard;
    }

    return self;
}

- (void)navigateToCollectionWithId:(NSString *)collectionId {
    CollectionViewController * controller = [_storyboard instantiateViewControllerWithIdentifier:@"CollectionViewController"];
    controller.collectionId = collectionId;
    controller.navigator = self;
    [self.navigationController pushViewController:controller animated:YES];
}

@end