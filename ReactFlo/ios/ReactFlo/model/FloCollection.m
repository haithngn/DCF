//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "FloCollection.h"

@implementation FloCollection {

}
- (instancetype)initWithCollectionId:(NSString *)collectionId collectionName:(NSString *)collectionName {
    self = [super init];
    if (self) {
        self.collectionId = collectionId;
        self.collectionName = collectionName;
    }

    return self;
}

@end