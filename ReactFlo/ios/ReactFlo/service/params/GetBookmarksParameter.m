//
// Created by Hai Nguyen Thanh on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "GetBookmarksParameter.h"
#import "FloBookmark.h"


@implementation GetBookmarksParameter {

}

- (instancetype)initWithUserId:(NSString *)userId pItem:(NSInteger)pItem minId:(NSString *)minId modifiedGTE:(NSNumber *)modifiedGTE ids:(NSArray<NSString *> *)ids hasDel:(BOOL)hasDel {
    self = [super init];
    if (self) {
        self.userId = userId;
        self.pItem = pItem;
        self.minId = minId;
        self.modifiedGTE = modifiedGTE;
        self.ids = ids;
        self.hasDel = hasDel;
    }

    return self;
}

@end