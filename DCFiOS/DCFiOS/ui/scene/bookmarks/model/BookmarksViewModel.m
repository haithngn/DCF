//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarksViewModel.h"
#import "UserService.h"
#import "BookmarkService.h"
#import "GetBookmarksParameter.h"
#import "FloItemViewModel.h"
#import "BookmarkItemViewModel.h"
#import "FloBookmark.h"

@interface NSArray (Bookmarks)

+ (NSArray <NSObject <FloItemViewModel>*>*)transformFromBookmarks:(NSArray<FloBookmark *>*)bookmarks;

@end

@interface BookmarksViewModel ()

@property (nonatomic, strong) NSString * kanbanId;
@property (nonatomic, strong) NSObject <UserService> * userService;
@property (nonatomic, strong) NSObject <BookmarkService> * bookmarkService;

@end

@implementation BookmarksViewModel {

}

- (instancetype)initWithKanbanId:(NSString *)kanbanId userService:(NSObject <UserService> *)userService bookmarkService:(NSObject <BookmarkService> *)bookmarkService {
    self = [super init];
    if (self) {
        self.kanbanId = kanbanId;
        self.userService = userService;
        self.bookmarkService = bookmarkService;
    }

    return self;
}

- (void)load {
    GetBookmarksParameter * parameter = [[GetBookmarksParameter alloc] initWithUserId:_userService.currentUserId
            pItem:5 minId:nil modifiedGTE:nil ids:@[] hasDel:false];
    
    __weak typeof(self) weakSelf = self;
    
    [_bookmarkService getBookmarks:parameter handler:^(NSArray<FloBookmark *> *bookmarks, NSError *error) {
        if (error == nil) {
            weakSelf.onItems ? weakSelf.onItems([NSArray transformFromBookmarks: bookmarks]) : nil;
        } else {
            weakSelf.onError ? weakSelf.onError(error.localizedDescription) : nil;
        }
    }];
}

@end

@implementation NSArray (FloCollection)

+ (NSArray <NSObject <FloItemViewModel>*>*)transformFromBookmarks:(NSArray<FloBookmark *>*)bookmarks {
    NSMutableArray <NSObject<FloItemViewModel> *>* result = [[NSMutableArray <NSObject<FloItemViewModel> *> alloc] init];
    for ( FloBookmark* bookmark in bookmarks ) {
        [result addObject:[[BookmarkItemViewModel alloc] initWithBookmarkId:bookmark.bookmarkId
                                                                       name:bookmark.name
                                                                urlInString:bookmark.urlInString]];
    }

    return result;
}

@end
