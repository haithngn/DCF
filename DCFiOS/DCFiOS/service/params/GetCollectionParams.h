//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GetCollectionParams : NSObject
@property (nonatomic, readonly) NSNumber * lastModified;

- (instancetype)initWithLastModified:(NSNumber * )lastModified;

@end