//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FloObjC/FloObjC.h>
#import "AuthorizationApi.h"

@interface AuthorizationApiImpl : NSObject <AuthorizationApi>
        
- (instancetype)initWithApi:(FloAuthenticationApi *)api;

@end
