//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FloKanban;
@class GetKanbanParameter;

@protocol KanbanService <NSObject>

- (void)getKanbans:(GetKanbanParameter *)params handler:(void (^)(NSArray<FloKanban *> *, NSError *))handler;

@end