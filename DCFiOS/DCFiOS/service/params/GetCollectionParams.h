//
// Created by Hai Nguyen on 2018-12-18.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GetCollectionParams : NSObject
@property (nonatomic, readonly) double lastModified;

- (instancetype)initWithLastModified:(double)lastModified;

@end