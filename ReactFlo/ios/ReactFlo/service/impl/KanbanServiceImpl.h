//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KanbanService.h"

@protocol KanbanApi;

@interface KanbanServiceImpl : NSObject <KanbanService>
- (id)initWithCollectionApi:(NSObject <KanbanApi> *)kanbanApi;
@end