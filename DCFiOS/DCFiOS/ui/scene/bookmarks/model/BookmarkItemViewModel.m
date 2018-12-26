//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarkItemViewModel.h"


@implementation BookmarkItemViewModel {

}
- (instancetype)initWithBookmarkId:(NSString *)bookmarkId name:(NSString *)name urlInString:(NSString *)urlInString {
    self = [super init];
    if (self) {
        self.bookmarkId = bookmarkId;
        self.name = name;
        self.urlInString = urlInString;
    }

    return self;
}

- (NSString *_Nonnull)objectId {
    return _bookmarkId;
}

- (NSString *_Nonnull)title {
    return _name;
}

@end