//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KanbanApi.h"

@class FloKanbanApi;

@interface KanbanApiImpl : NSObject <KanbanApi>
- (instancetype)initWithApi:(FloKanbanApi *)api;

@end