//
// Created by Hai Nguyen Thanh on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "FloBookmark.h"
#import "GetBookmarksParameter.h"


@implementation FloBookmark {

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

@end