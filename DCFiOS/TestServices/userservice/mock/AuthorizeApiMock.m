//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "AuthorizeApiMock.h"
#import "LoginParameter.h"


@implementation AuthorizeApiMock {

}

- (void)signIn:(LoginParameter *)params complete:(void (^)(FloUser *, Credentials *credentials, NSError *))handler {
    _username = params.username;
    _password = params.password;
}

@end