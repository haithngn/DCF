//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarkServiceImpl.h"
#import "BookmarkApi.h"

@interface BookmarkServiceImpl ()

@property (nonatomic, strong) NSObject <BookmarkApi> * api;

@end

@implementation BookmarkServiceImpl {

}

- (instancetype)initWithBookmarkApi:(NSObject <BookmarkApi> *)api {
    self = [super init];
    if (self) {
        self.api = api;
    }

    return self;
}

@end