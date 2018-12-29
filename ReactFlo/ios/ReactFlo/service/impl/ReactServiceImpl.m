//
// Created by Hai Nguyen Thanh on 2018-12-29.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "ReactServiceImpl.h"
#import "RFBridging.h"

@interface ReactServiceImpl () <RFBridgingAuthorizeDelegate>

@property (nonatomic, strong) RFBridging * bridger;
@property (nonatomic, strong) NSMutableArray <NSObject <ReactObserver> *> * subscribers;

@end

@implementation ReactServiceImpl {

@private
    NSMutableArray<NSObject <ReactObserver> *> *_subscribers;
}

@synthesize subscribers = _subscribers;

- (instancetype)initWithBridger:(RFBridging *)bridger {
    self = [super init];
    if (self) {
        self.bridger = bridger;
        bridger.authorizeDelegate = self;
    }

    return self;
}

- (void)subscribe:(NSObject <ReactObserver> *)client {
    if ([self.subscribers containsObject:client] == NO) {
        [self.subscribers addObject:client];
    }
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