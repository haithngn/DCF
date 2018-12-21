//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>
#import "CollectionsViewModel.h"
#import "CollectionService.h"
#import "ProjectItemViewModel.h"
#import "FloCollection.h"
#import "FloItemViewModel.h"

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose | DDLogLevelError;

@interface NSArray (FloCollection)

+ (NSArray <NSObject <ProjectItemViewModel> *>*)transformFrom:(NSArray<FloCollection *>*)collections;

@end

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
    _onPreventInteractions ? _onPreventInteractions(YES) : nil;
    [_collectionService findAll:^(NSArray<FloCollection *> *collections, NSError *error) {
        DDLogDebug(@"Collections: %@", collections);
        if (error != nil) {
            DDLogError(@"Error : %@", error);
        } else {
            self.onProjects ? self.onProjects([NSArray transformFrom:collections]) : nil;
            self.onPreventInteractions ? self.onPreventInteractions(NO) : nil;
        }
    }];
}


- (void)select:(NSObject <FloItemViewModel> *)collection {
    _onSelect ? _onSelect(collection.objectId) : nil;
}

@end

@implementation NSArray (FloCollection)

+ (NSArray <ProjectItemViewModel*> *)transformFrom:(NSArray<FloCollection *>*)collections {
    NSMutableArray <ProjectItemViewModel*> * result = [[NSMutableArray <ProjectItemViewModel *> alloc] init];
    for ( FloCollection* c in collections ) {
        [result addObject:[[ProjectItemViewModel alloc] initWithProjectId:c.collectionId projectName:c.collectionName]];
    }

    return result;
}

@end
