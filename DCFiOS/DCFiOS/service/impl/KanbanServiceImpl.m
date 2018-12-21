//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "KanbanServiceImpl.h"
#import "KanbanApi.h"

@interface KanbanServiceImpl ()

@property (nonatomic, strong) NSObject <KanbanApi> * kanbanApi;

@end

@implementation KanbanServiceImpl {

}

- (id)initWithCollectionApi:(NSObject <KanbanApi> *)kanbanApi {
    self = [super init];
    if (self) {
        self.kanbanApi = kanbanApi;
    }

    return self;
}

- (void)getKanbans:(GetKanbanParameter *)params handler:(void (^)(NSArray<FloKanban *> *, NSError *))handler {
    [_kanbanApi getKanbans:params handler:handler];
}

@end