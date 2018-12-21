//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@protocol CollectionService;
@protocol ProjectItemViewModel;
@protocol FloItemViewModel;

@interface CollectionsViewModel : BaseViewModel
@property(nonatomic, copy) void (^onProjects)(NSArray <ProjectItemViewModel> * projectViewModels);
@property(nonatomic, copy) void (^onSelect)(NSString * pcollectionId);
@property(nonatomic, copy) void (^onPreventInteractions)(BOOL prevent);

- (instancetype)initWithCollectionService:(NSObject <CollectionService> *)collectionService;
- (void)load;
- (void)select:(NSObject <FloItemViewModel> *)collection;

@end