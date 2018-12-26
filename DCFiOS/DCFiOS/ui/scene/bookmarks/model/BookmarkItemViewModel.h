//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FloItemViewModel.h"

@interface BookmarkItemViewModel : NSObject <FloItemViewModel>
@property (nonatomic, copy) NSString * bookmarkId;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * urlInString;

- (instancetype)initWithBookmarkId:(NSString *)bookmarkId name:(NSString *)name urlInString:(NSString *)urlInString;


@end