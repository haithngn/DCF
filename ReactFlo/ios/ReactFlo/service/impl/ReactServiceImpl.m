//
// Created by Hai Nguyen Thanh on 2018-12-29.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "ReactServiceImpl.h"
#import "RFBridging.h"
#import "UserService.h"
#import "LoginParameter.h"

@interface ReactServiceImpl () <RFBridgingAuthorizeDelegate>

@property (nonatomic, strong) RFBridging * bridger;
@property (nonatomic, strong) NSMutableArray <NSObject <ReactObserver> *> * subscribers;
@property (nonatomic, strong) NSObject <UserService> * userService;

@end

@implementation ReactServiceImpl {

@private
    NSMutableArray<NSObject <ReactObserver> *> *_subscribers;
}

@synthesize subscribers = _subscribers;

- (instancetype)initWithBridger:(RFBridging *)bridger userservice:(NSObject <UserService> * ) userService {
    self = [super init];
    if (self) {
        self.bridger = bridger;
        bridger.authorizeDelegate = self;
        self.userService = userService;
    }

    return self;
}

- (void)subscribe:(NSObject <ReactObserver> *)client {
    if ([self.subscribers containsObject:client] == NO) {
        [self.subscribers addObject:client];
    }
}

- (void)didSubmit:(NSString *)username password:(NSString *)password callback:(RCTResponseSenderBlock)callback {
    LoginParameter * parameter = [[LoginParameter alloc] initWithUsername:username password:password];
    [_userService signIn:parameter complete:^(FloUser *user, NSError *error) {
        if (error != nil) {
            callback(@[@"{\"error\":\"code\"}"]);
        } else {
            callback(@[[NSNull null]]);
        }
    }];
}

- (void)didSubmit:(NSString *)username password:(NSString *)password {
    [self.subscribers enumerateObjectsUsingBlock:^(NSObject <ReactObserver> *observer, NSUInteger idx, BOOL *stop) {
        [observer didSubmit:username password:password];
    }];
}


#pragma mark -

- (NSMutableArray <NSObject <ReactObserver> *> * ) subscribers{
    if (_subscribers == nil) {
        _subscribers = [[NSMutableArray <NSObject <ReactObserver> *> alloc] init];
    }

    return _subscribers;
}

@end