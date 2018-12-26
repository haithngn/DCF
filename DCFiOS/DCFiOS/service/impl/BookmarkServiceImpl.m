//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarkServiceImpl.h"
#import "BookmarkApi.h"
#import "BookmarkRepository.h"

@interface BookmarkServiceImpl ()

@property (nonatomic, strong) NSObject <BookmarkApi> * api;
@property (nonatomic, strong) NSObject <BookmarkRepository> * repository;

@end

@implementation BookmarkServiceImpl {

}

- (instancetype)initWithBookmarkApi:(NSObject <BookmarkApi> *)api repository:(NSObject <BookmarkRepository> *) repository {
    self = [super init];
    if (self) {
        self.api = api;
        self.repository = repository;
    }

    return self;
}

- (void)getBookmarks:(GetBookmarksParameter *)params handler:(void (^)(NSArray <FloBookmark *> *bookmarks, NSError *error))handler {
    __weak typeof(self) weakSelf = self;
    [_api getBookmarks:params handler: ^(NSArray <FloBookmark *> *bookmarks, NSError *error){
        if (error != nil) {
            handler ? handler(bookmarks, error) : nil;
        } else {
            [weakSelf.repository save:bookmarks handler: handler];
        }
    }];
}

- (FloBookmark *)findById:(NSString *)bookmarkId {
    return [_repository findById: bookmarkId];
}


@end