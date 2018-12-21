//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloObjC/FloObjC.h>
#import "BookmarkApiImpl.h"

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

@end