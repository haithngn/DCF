//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloObjC/FloObjC.h>
#import "BookmarkApiImpl.h"
#import "GetBookmarksParameter.h"
#import "FloBookmark.h"
#import <FloRest/FloRest.h>
#import <CoreFlo/CoreFlo.h>

@interface BookmarkApiImpl ()

@property (nonatomic, strong) FloBookmarkApi * api;

@end

@implementation BookmarkApiImpl {

}

- (instancetype)initWithApi:(FloBookmarkApi *)api {
    self = [super init];
    if (self) {
        self.api = api;
    }

    return self;
}

- (void)getBookmarks:(GetBookmarksParameter *)params handler:(void (^)(NSArray <FloBookmark *> *bookmarks, NSError *error))handler {
/*
 * @objc public var pItem:Int
    @objc public var minId:String
    @objc public var modifiedGTE: NSNumber?
    @objc public var ids:[String]?
    @objc public var hasDel:Bool
    @objc public var userId: String
    
 * */
    GetBookmarksParams * getBookmarkParams = [[GetBookmarksParams alloc] initWithUserId:params.userId
            pItem:params.pItem minId:params.minId modifiedGTE:params.modifiedGTE ids:params.ids hasDel: params.hasDel];
    [_api getBookmarksWithParams:getBookmarkParams handler:^(NSArray <Bookmark*>* bookmarks, NSError *error) {
        NSMutableArray<FloBookmark *> * result = [[NSMutableArray<FloBookmark *> alloc] init];
        for (Bookmark * bookmark in bookmarks) {
            [result addObject:[[FloBookmark alloc] initWithBookmarkId:bookmark.id name:bookmark.title urlInString:bookmark.url]];
        }
        handler != nil ? handler(result, error) : nil;
    }];
}


@end
