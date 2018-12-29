//
// Created by Hai Nguyen Thanh on 2018-12-29.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactService.h"

@class RFBridging;

@interface ReactServiceImpl : NSObject <ReactService>
- (instancetype)initWithBridger:(RFBridging *)bridger;

@end