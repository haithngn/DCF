//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "KanbansViewModel.h"
#import "KanbanService.h"
#import "UserService.h"
#import "FloItemViewModel.h"

@interface KanbansViewModel ()

@property(nonatomic, strong) NSObject <KanbanService> * kanbanService;
@property(nonatomic, strong) NSObject <UserService> * userService;
@property(nonatomic, copy) NSString * _Nonnull collectionId;

@end

@implementation KanbansViewModel {

}

- (id)initWithKanbanService:(NSObject <KanbanService> *)kanbanService userService:(NSObject <UserService> *)userService collectionId:(NSString *)collectionId {
    self = [super init];
    if (self) {
        self.kanbanService = kanbanService;
        self.collectionId = collectionId;
        self.userService = userService;
    }

    return self;
}

- (void)load {

}

@end