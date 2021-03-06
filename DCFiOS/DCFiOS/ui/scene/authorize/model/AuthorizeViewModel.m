//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>
#import "AuthorizeViewModel.h"
#import "UserService.h"
#import "LoginParameter.h"

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface AuthorizeViewModel()

@property (nonatomic, strong) NSObject <UserService> * userService;

@end

@implementation AuthorizeViewModel
- (void)setUsername:(NSString *)username {
    _username = username;
}

- (void)setPassword:(NSString *)password {
    _password = password;
}

#pragma mark -

- (void)login {
    LoginParameter * params = [[LoginParameter alloc] initWithUsername:_username password:_password];
    __weak AuthorizeViewModel *weakSelf = self;
    [_userService signIn:params complete:^(FloUser *user, NSError *error) {
        if (error != nil) {
            weakSelf.onError != nil ? weakSelf.onError(error.localizedDescription) : nil;
        } else {
            DDLogVerbose(@"User %@", user);
        }
    }];
}

#pragma mark - Constructors

- (instancetype)initWithUserService:(NSObject <UserService>*)userService {
    self = [super init];
    if (self) {
        self.userService = userService;
        _username = @"ios@123flo.com";
        _password = @"111111";
    }

    return self;
}

@end
