//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KanbanService;
@protocol UserService;
@protocol FloItemViewModel;

@interface KanbansViewModel : NSObject
@property(nonatomic, copy) void (^onItems)(NSArray<NSObject <FloItemViewModel> *> *);

- (id)initWithKanbanService:(NSObject <KanbanService> *)kanbanService userService:(NSObject <UserService> *)userService collectionId:(NSString *)collectionId;
- (void)load;

@end