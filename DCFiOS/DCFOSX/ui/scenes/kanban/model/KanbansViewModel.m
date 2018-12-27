//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "KanbansViewModel.h"
#import "KanbanService.h"
#import "UserService.h"
#import "FloItemViewModel.h"
#import "GetKanbanParameter.h"
#import "KanbanItemViewModel.h"
#import "FloKanban.h"

@interface NSArray (FloKanban)

+ (NSArray <KanbanItemViewModel * > *)transformFromKanbans:(NSArray<FloKanban *>*)kanbans;

@end

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
    NSString * userId = _userService.currentUserId;
    GetKanbanParameter * params = [[GetKanbanParameter alloc] initWithUserId:userId pItem:[NSNumber numberWithInt:5] minId:nil hasDelete:NO modifiedGTEInSecond:nil];
    
    __weak typeof(self) weakSelf = self;
    
    [_kanbanService getKanbans:params handler:^(NSArray<FloKanban *> * kanbans, NSError *error) {
        if (error == nil) {
            weakSelf.onItems ? weakSelf.onItems([NSArray transformFromKanbans:kanbans]) : nil;
        } else {
            weakSelf.onError ? weakSelf.onError(error.localizedDescription) : nil;
        }
    }];
}

@end

@implementation NSArray (FloKanban)

+ (NSArray <KanbanItemViewModel * > *)transformFromKanbans:(NSArray<FloKanban *>*)kanbans {
    NSMutableArray <KanbanItemViewModel*> * result = [[NSMutableArray <KanbanItemViewModel *> alloc] init];
    for ( FloKanban* k in kanbans ) {
        [result addObject:[[KanbanItemViewModel alloc] initWithKanbanId:k.id kanbanName:k.name]];
    }

    return result;
}

@end
