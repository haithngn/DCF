//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionViewModel.h"
#import "CollectionItemViewModel.h"
#import "KanbanService.h"
#import "GetKanbanParameter.h"
#import "UserService.h"

@protocol KanbanService;

@class FloKanban;

@interface CollectionViewModel ()

@property(nonatomic, assign) NSInteger selectingIndex;
@property(nonatomic, strong) NSObject <KanbanService> * kanbanService;
@property(nonatomic, strong) NSObject <UserService> * userService;
@property(nonatomic, copy) NSString * _Nonnull collectionId;

@end

@implementation CollectionViewModel {

}

- (instancetype)initWithKanbanService:(NSObject <KanbanService> *)kanbanService
                          userService:(NSObject <UserService> *) userService collectionId:(NSString * _Nonnull)collectionId {
    self = [super init];
    if (self) {
        self.kanbanService = kanbanService;
        self.collectionId = collectionId;
        self.userService = userService;
    }

    return self;
}

- (void)load{
    NSString * userId = _userService.currentUserId;
    GetKanbanParameter * parameter = [[GetKanbanParameter alloc] initWithUserId:userId pItem:nil
            minId:nil hasDelete:false modifiedGTEInSecond:nil];
    [_kanbanService getKanbans:parameter handler:^(NSArray<FloKanban *> *kanbans, NSError *error) {
        if (error != nil ) {

        } else {
            [self mine: kanbans];
        }
    }];
}

- (void)mine:(NSArray <FloKanban*> *)kanbans {
    switch (_selectingIndex) {
        case 0:
            break;
        default:
            break;
    }
}

- (void)setSelectKanbanAtIndex:(NSInteger)selectKanbanAtIndex {
    _selectingIndex = selectKanbanAtIndex;
    [self load];
}

@end
