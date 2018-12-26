//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloObjC/FloObjC.h>
#import <CoreFlo/CoreFlo.h>
#import "CollectionApiImpl.h"
#import "GetCollectionParameter.h"
#import "FloCollection.h"

@class GetCollectionsParams;

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

- (void)getCollections:(GetCollectionParameter *)params handler:(void (^)(NSArray<FloCollection *> *collections, NSError *error))handler {
    GetCollectionsParams *getCollectionsParams = [[GetCollectionsParams alloc] initWithLastModified: params.lastModified];
    [_api getCollectionsWithParams:getCollectionsParams handler:^(NSArray <Project *> * projects, NSError *error) {
        NSMutableArray<FloCollection *> * result = [[NSMutableArray<FloCollection *> alloc] init];
        for (Project * p in projects) {
            [result addObject:[[FloCollection alloc] initWithCollectionId:p.id collectionName:p.projName]];
        }
        handler != nil ? handler(result, error) : nil;
    }];
}


@end
