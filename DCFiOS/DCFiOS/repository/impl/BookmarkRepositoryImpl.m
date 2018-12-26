//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarkRepositoryImpl.h"

@interface BookmarkRepositoryImpl ()

@property (nonatomic, strong) NSMutableArray <FloBookmark *> * bookmarks;

@end

@implementation BookmarkRepositoryImpl {

@private
    NSMutableArray<FloBookmark *> *_bookmarks;
}

@synthesize bookmarks = _bookmarks;

- (void)save:(NSArray<FloBookmark *> *)bookmarks handler:(void (^)(NSArray<FloBookmark *> *, NSError *))handler {
    [self.bookmarks setArray:bookmarks];
    handler ? handler(bookmarks, nil) : nil;
}

- (FloBookmark *)findById:(NSString *)bookmarkId {
    FloBookmark * result = nil;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"bookmarkId == %@", bookmarkId];
    NSArray *filteredArray = [self.bookmarks filteredArrayUsingPredicate:predicate];

    if (filteredArray.count != 0) {
        result = (FloBookmark * )filteredArray.firstObject;
    }

    return result;
}

#pragma mark -

- (NSMutableArray<FloBookmark *> *)bookmarks {
    if (_bookmarks == nil) {
        _bookmarks = [[NSMutableArray <FloBookmark *> alloc] init];
    }

    return _bookmarks;
}


@end