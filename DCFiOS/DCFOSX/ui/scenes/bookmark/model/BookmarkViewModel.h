//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@protocol BookmarkService;

@interface BookmarkViewModel : BaseViewModel
@property(nonatomic, copy) NSString * bookmarkId;
@property(nonatomic, copy) void (^onError)(NSString *);
@property(nonatomic, copy) void (^onUrl)(NSString *);

- (instancetype)initWithBookmarkService:(NSObject <BookmarkService> *)bookmarkService bookmarkId:(NSString *)bookmarkId;
- (void)load;

@end