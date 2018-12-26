//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@protocol BookmarkService;
@protocol UserService;
@protocol FloItemViewModel;

@interface BookmarksViewModel : BaseViewModel
@property(nonatomic, copy) void (^onItems)(NSArray<NSObject <FloItemViewModel> *> *);
@property(nonatomic, copy) void (^onError)(NSString *);

- (instancetype)initWithKanbanId:(NSString *)kanbanId userService:(NSObject <UserService> *)userService bookmarkService:(NSObject <BookmarkService> *)bookmarkService;

- (void)load;

@end