//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Navigator <NSObject>
@required
- (void)navigateToCollectionWithId:(NSString *)collectionId;
@end
