//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@protocol BookmarkService;
@protocol UserService;

@interface BookmarksViewModel : BaseViewModel
- (instancetype)initWithCollectionId:(NSString *)collectionId userService:(NSObject <UserService> *)userService bookmarkService:(NSObject <BookmarkService> *)bookmarkService;

- (void)load;

@end