//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseOSXViewController.h"

@protocol CollectionsViewDelegate <NSObject>
@optional

- (void)openCollection:(NSString *)collectionId;

@end

@interface CollectionsOSXViewController : BaseOSXViewController
@property(nonatomic, weak) NSObject <CollectionsViewDelegate> *delegate;

- (void)bindData;

@end