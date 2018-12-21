//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CollectionItemViewModel;
@protocol KanbanService;
@protocol UserService;

@interface CollectionViewModel : NSObject
@property(nonatomic, copy) void (^onItems)(NSArray<CollectionItemViewModel *> * items);
@property(nonatomic, copy) void (^onError)(NSString * message);
@property(nonatomic, assign) NSInteger selectKanbanAtIndex;

- (instancetype)initWithKanbanService:(NSObject <KanbanService> *)kanbanService
                          userService:(NSObject <UserService> *) userService collectionId:(NSString * _Nonnull)collectionId;

@end