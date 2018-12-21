//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "KanbanItemViewModel.h"


@interface KanbanItemViewModel ()

@property (nonatomic, copy) NSString * kanbanId;
@property (nonatomic, copy) NSString * kanbanName;

@end

@implementation KanbanItemViewModel {

}
- (instancetype)initWithKanbanId:(NSString *)kanbanId kanbanName:(NSString *)kanbanName {
    self = [super init];
    if (self) {
        self.kanbanId = kanbanId;
        self.kanbanName = kanbanName;
    }

    return self;
}

- (NSString *_Nonnull)objectId {
    return _kanbanId;
}

- (NSString *_Nonnull)title {
    return _kanbanName;
}

@end