//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>
#import "CollectionsViewModel.h"
#import "CollectionService.h"

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose | DDLogLevelError;

@interface CollectionsViewModel ()

@property (nonatomic, strong) NSObject <CollectionService> * collectionService;

@end

@implementation CollectionsViewModel {

}

- (instancetype)initWithCollectionService:(NSObject <CollectionService> *)collectionService {
    self = [super init];
    if (self) {
        self.collectionService = collectionService;
    }

    return self;
}

- (void)load {
    [_collectionService findAll:^(NSArray<FloCollection *> *collections, NSError *error) {
        DDLogDebug(@"Collections: %@", collections);
        if (error != nil) {
            DDLogError(@"Error : %@", error);
        }
    }];
}


@end