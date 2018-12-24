//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCF-Bridging-Header.h"

@class FloConfigurations;
@protocol UserService;
@protocol BroadcastService;
@protocol CollectionService;
@protocol KanbanService;
@protocol BookmarkService;

@interface Dependences : NSObject

+ (FloConfigurations*)configurations;
+ (NSObject <UserService>*) userService;
+ (NSObject <BroadcastService> *)broadcastService;
+ (NSObject <CollectionService> *)collectionService;
+ (NSObject <KanbanService> *)kanbanService;
+ (NSObject <BookmarkService>*)bookmarkService;
@end
