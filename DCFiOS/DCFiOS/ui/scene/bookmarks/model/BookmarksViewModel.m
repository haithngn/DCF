//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarksViewModel.h"
#import "UserService.h"
#import "BookmarkService.h"
#import "GetBookmarksParameter.h"

@interface BookmarksViewModel ()

@property (nonatomic, strong) NSString * collectionId;
@property (nonatomic, strong) NSObject <UserService> * userService;
@property (nonatomic, strong) NSObject <BookmarkService> * bookmarkService;

@end

@implementation BookmarksViewModel {

}

- (instancetype)initWithCollectionId:(NSString *)collectionId userService:(NSObject <UserService> *)userService bookmarkService:(NSObject <BookmarkService> *)bookmarkService {
    self = [super init];
    if (self) {
        self.collectionId = collectionId;
        self.userService = userService;
        self.bookmarkService = bookmarkService;
    }

    return self;
}

- (void)load {
    GetBookmarksParameter * parameter = [[GetBookmarksParameter alloc] initWithUserId:_userService.currentUserId
            pItem:5 minId:nil modifiedGTE:nil ids:@[] hasDel:false];
    [_bookmarkService getBookmarks:parameter handler:^(NSArray<FloBookmark *> *bookmarks, NSError *error) {

    }];
}

@end