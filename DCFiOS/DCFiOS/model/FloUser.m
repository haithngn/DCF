//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "FloUser.h"
#import "LoginParams.h"


@implementation FloUser {

}
- (instancetype)initWithId:(NSString *)id {
    self = [super init];
    if (self) {
        _id = id;
    }

    return self;
}

+ (instancetype)userWithId:(NSString *)id {
    return [[self alloc] initWithId:id];
}

@end