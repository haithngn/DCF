//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookmarkService.h"

@protocol BookmarkApi;
@protocol BookmarkRepository;


@interface BookmarkServiceImpl : NSObject <BookmarkService>

- (instancetype)initWithBookmarkApi:(NSObject <BookmarkApi> *)api repository:(NSObject <BookmarkRepository> *) repository;

@end