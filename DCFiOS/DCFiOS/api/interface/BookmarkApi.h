//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GetBookmarksParameter;
@class FloBookmark;

@protocol BookmarkApi <NSObject>
@required
- (void)getBookmarks:(GetBookmarksParameter *)params handler:(void (^)(NSArray <FloBookmark *> *bookmarks, NSError *error))handler;

@end