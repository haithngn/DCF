//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "GetCollectionParams.h"
#import "FloCollection.h"


@implementation GetCollectionParams {

}

- (instancetype)initWithLastModified:(NSNumber*)lastModified {
    self = [super init];
    if (self) {
        _lastModified = lastModified;
    }

    return self;
}

@end