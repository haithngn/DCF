//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloRest/FloRest.h>
#import "AuthorizationApiImpl.h"
#import "LoginParams.h"
#import "FloUser.h"

@interface AuthorizationApiImpl ()

@property (nonatomic, strong) FloAuthenticationApi * api;

@end

@implementation AuthorizationApiImpl {

}
- (instancetype)initWithApi:(FloAuthenticationApi *)api {
    self = [super init];
    if (self) {
        self.api = api;
    }

    return self;
}


- (void)signIn:(LoginParams *)params complete:(void (^)(FloUser *, NSError *))handler {
    [_api loginWithParams: @{} succeed: ^(id result){} failure: ^(id error){}];
}

@end