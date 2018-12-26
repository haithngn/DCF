//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorizationApi.h"

@interface AuthorizeApiMock : NSObject <AuthorizationApi>
@property (nonatomic, readonly) NSString * username;
@property (nonatomic, readonly) NSString * password;

@end
