//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseOSXViewController.h"

@class MainOSXViewController;

@protocol KanbansViewDelegate <NSObject>
@optional
- (void)openKanban:(NSString *) kanbanId;

@end

@interface KanbansViewController : BaseOSXViewController
@property (nonatomic, copy) NSString * collectionId;
@property(nonatomic, strong) NSObject <KanbansViewDelegate> * delegate;

@end