//
// Created by Hai Nguyen Thanh on 2018-12-29.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactService.h"

@class RFBridging;
@protocol UserService;
@protocol CollectionService;

@interface ReactServiceImpl : NSObject <ReactService>
- (instancetype)initWithBridger:(RFBridging *)bridger userservice:(NSObject <UserService> * ) userService collectionService:(NSObject <CollectionService> *) collectionService;

@end