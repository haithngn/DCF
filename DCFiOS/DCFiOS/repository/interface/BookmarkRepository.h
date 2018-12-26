//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FloBookmark;

@protocol BookmarkRepository <NSObject>
@required
- (void)save:(NSArray<FloBookmark *> *)bookmarks handler:(void (^)(NSArray<FloBookmark *> *, NSError *))handler;
- (FloBookmark *)findById:(NSString *)bookmarkId;

@end