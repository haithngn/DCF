//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "BroadcastService.h"

@protocol UserService;


@interface NavigationsViewModel : BaseViewModel
- (instancetype)initWithUserService:(NSObject <UserService> *) userService;

- (void)signOut;

@end