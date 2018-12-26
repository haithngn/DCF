//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarkViewModel.h"
#import "BookmarkService.h"
#import "FloBookmark.h"

@interface BookmarkViewModel ()

@property (nonatomic, weak) NSObject <BookmarkService> * bookmarkService;

@end

@implementation BookmarkViewModel {

}

- (instancetype)initWithBookmarkService:(NSObject <BookmarkService> *)bookmarkService bookmarkId:(NSString *)bookmarkId {
    self = [super init];
    if (self) {
        self.bookmarkService = bookmarkService;
        self.bookmarkId = bookmarkId;
    }

    return self;
}

- (void)load {
    FloBookmark * bookmark = [_bookmarkService findById: _bookmarkId];
    if (bookmark == nil) {
        _onError ? _onError(@"This bookmark could not be found") : nil;
    } else {
        _onUrl ? _onUrl(bookmark.urlInString) : nil;
    }
}


@end