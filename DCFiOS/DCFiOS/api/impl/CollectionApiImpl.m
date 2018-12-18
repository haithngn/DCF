//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloObjC/FloObjC.h>
#import "CollectionApiImpl.h"
#import "GetCollectionParams.h"

@interface CollectionApiImpl ()

@property (nonatomic, strong) FloCollectionApi * api;

@end

@implementation CollectionApiImpl {

}

- (instancetype)initWithApi:(FloCollectionApi *)api {
    self = [super init];
    if (self) {
        self.api = api;
    }

    return self;
}

- (void)getCollections:(GetCollectionParams *)params handler:(void (^)(NSArray<FloCollection *> *collections, NSError *error))handler {
    GetCollectionsParams *getCollectionsParams = [[GetCollectionsParams alloc] initWithLastModified: params.lastModified];
    [_api getCollectionsWithParams:getCollectionsParams handler:^(NSArray <Project *> * projects, NSError *error) {
        handler != nil ? handler(@[], error) : nil;
    }];
}


@end