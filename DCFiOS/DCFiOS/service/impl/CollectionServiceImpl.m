//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionServiceImpl.h"
#import "CollectionApi.h"
#import "GetCollectionParams.h"
#import "FloCollection.h"

@interface CollectionServiceImpl ()

@property (nonatomic, strong) NSObject <CollectionApi> * collectionApi;

@end

@implementation CollectionServiceImpl {

}
- (instancetype)initWithCollectionApi:(NSObject <CollectionApi> *)collectionApi {
    self = [super init];
    if (self) {
        self.collectionApi = collectionApi;
    }

    return self;
}

- (void)findAll:(void (^)(NSArray<FloCollection *> * collections, NSError * error))handler {
    GetCollectionParams * params = [[GetCollectionParams alloc] initWithLastModified:[NSDate date].timeIntervalSince1970];
    [_collectionApi getCollections:params handler:^(NSArray<FloCollection *> *collections, NSError *error) {
        handler != nil ? handler(collections, error) : nil;
    }];
}

@end