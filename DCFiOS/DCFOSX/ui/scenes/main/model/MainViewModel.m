//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "MainViewModel.h"


@implementation MainViewModel {

}

- (void)openCollection:(NSString *)collectionId {
    _onOpenCollection ? _onOpenCollection(collectionId) : nil;
}

@end