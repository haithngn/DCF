//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "NavigationsViewModel.h"
#import "UserService.h"
#import "KanbanService.h"
#import "GetKanbanParameter.h"
#import "FloItemViewModel.h"
#import "KanbanItemViewModel.h"
#import "FloKanban.h"

@interface NavigationsViewModel ()

@property (nonatomic, strong) NSObject <UserService> * userService;
@property(nonatomic, strong) NSObject <KanbanService> * kanbanService;

@end

@implementation NavigationsViewModel {

}

- (instancetype)initWithKanbanService:(NSObject <KanbanService> *)kanbanService
                          userService:(NSObject <UserService> *) userService {
    self = [super init];
    if (self) {
        self.userService = userService;
        self.kanbanService = kanbanService;
    }

    return self;
}

- (void)signOut {
    [_userService logOut];
}

- (void)setCollectionId:(NSString *)collectionId {
    if (collectionId == nil) {

    } else {
        _collectionId = [collectionId mutableCopy];
    }
    [self load];
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

- (void)mine:(NSArray <FloKanban*> * _Nonnull)kanbans {
    NSMutableArray <NSObject<FloItemViewModel> * > * result = [[NSMutableArray <NSObject<FloItemViewModel> * > alloc] init];
    for (FloKanban * kanban in kanbans) {
        [result addObject:[[KanbanItemViewModel alloc] initWithKanbanId:kanban.id kanbanName:kanban.name]];
    }

    self.onKanbans ? self.onKanbans(result) : nil;
}

- (void)select:(NSObject <FloItemViewModel> *)kanbanId {
    _onSelectKanban ? _onSelectKanban(kanbanId.objectId) : nil;
}

@end
