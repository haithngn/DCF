//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "BroadcastService.h"

@protocol UserService;
@protocol KanbanService;
@protocol FloItemViewModel;


@interface NavigationsViewModel : BaseViewModel
@property(nonatomic, copy) NSString *collectionId;
@property(nonatomic, copy) void (^onKanbans)(NSArray<NSObject <FloItemViewModel> *> * items);
@property(nonatomic, copy) void (^onSelectKanban)(NSString * kanbanId);

- (instancetype)initWithKanbanService:(NSObject <KanbanService> *)kanbanService
                          userService:(NSObject <UserService> *) userService;
- (void)signOut;
- (void)select:(NSObject <FloItemViewModel> *)kanbanId;

@end