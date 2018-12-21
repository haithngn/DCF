//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "FloKanban.h"


@implementation FloKanban {

}
- (instancetype)initWithId:(NSString *)id name:(NSString *)name {
    self = [super init];
    if (self) {
        self.id = id;
        self.name = name;
    }

    return self;
}

@end