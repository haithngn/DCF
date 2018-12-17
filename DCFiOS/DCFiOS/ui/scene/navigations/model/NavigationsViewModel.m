//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "NavigationsViewModel.h"
#import "UserService.h"

@interface NavigationsViewModel ()

@property (nonatomic, strong) NSObject <UserService> * userService;

@end

@implementation NavigationsViewModel {

}

- (instancetype)initWithUserService:(NSObject <UserService> *) userService {
    self = [super init];
    if (self) {
        self.userService = userService;
    }

    return self;
}

- (void)signOut {
    [_userService logOut];
}


@end