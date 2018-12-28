//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloObjC/FloObjC.h>
#import "KanbanApiImpl.h"
#import "GetKanbanParameter.h"
#import "FloKanban.h"
#import <FloRest/FloRest.h>

@class FloKanbanApi;

@class Kanban;

@class GetKanbanParams;

@interface KanbanApiImpl()

@property (nonatomic, strong) FloKanbanApi * api;

@end

@implementation KanbanApiImpl {

}

- (instancetype)initWithApi:(FloKanbanApi *)api {
    self = [super init];
    if (self) {
        self.api = api;
    }

    return self;
}


- (void)getKanbans:(GetKanbanParameter *)params handler:(void (^)(NSArray<FloKanban *> *, NSError *))handler {
    GetKanbanParams * getKanbanParams = [[GetKanbanParams alloc] initWithUserId:params.userId
                                                                          pItem:params.pItem
                                                                          minId:params.minId
                                                                      hasDelete:[NSNumber numberWithBool:params.hasDelete] modifiedGTE:params.modifiedGTEInSecond];
    [_api get:getKanbanParams handler:^(NSArray <Kanban*> *cKanbans, NSError *error) {
        NSMutableArray <FloKanban *> * result = [[NSMutableArray <FloKanban *> alloc] init];
        if (cKanbans != nil) {
            for ( Kanban * cKanban in cKanbans) {
                [result addObject:[[FloKanban alloc] initWithId:cKanban.id name:cKanban.name]];
            }
        }
        handler ? handler(result, error) : nil;
    }];
}

@end
