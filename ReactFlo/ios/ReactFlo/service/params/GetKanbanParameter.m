//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "GetKanbanParameter.h"


@implementation GetKanbanParameter {

}
- (instancetype)initWithUserId:(NSString *)userId pItem:(NSNumber *)pItem minId:(NSString *)minId
                     hasDelete:(BOOL)hasDelete modifiedGTEInSecond:(NSNumber *)modifiedGTEInSecond {
    self = [super init];
    if (self) {
        _userId = userId;
        _pItem = pItem;
        _minId = minId;
        _hasDelete = hasDelete;
        _modifiedGTEInSecond = modifiedGTEInSecond;
    }

    return self;
}

@end
