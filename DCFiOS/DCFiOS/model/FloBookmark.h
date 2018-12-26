//
// Created by Hai Nguyen Thanh on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FloBookmark : NSObject
@property(nonatomic, copy) NSString *bookmarkId;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *urlInString;

- (instancetype)initWithBookmarkId:(NSString *)bookmarkId name:(NSString *)name urlInString:(NSString *)urlInString;


@end