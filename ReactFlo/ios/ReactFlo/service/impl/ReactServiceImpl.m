//
// Created by Hai Nguyen Thanh on 2018-12-29.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "ReactServiceImpl.h"
#import "RFBridging.h"
#import "UserService.h"
#import "LoginParameter.h"
#import "CollectionService.h"
#import "FloCollection.h"

@interface ReactServiceImpl () <RFBridgingAuthorizeDelegate, RFBridgingCollectionDelegate>

@property (nonatomic, strong) RFBridging * bridger;
@property (nonatomic, strong) NSMutableArray <NSObject <ReactObserver> *> * subscribers;
@property (nonatomic, strong) NSObject <UserService> * userService;
@property (nonatomic, strong) NSObject <CollectionService> * collectionService;

@end

@implementation ReactServiceImpl {

@private
    NSMutableArray<NSObject <ReactObserver> *> *_subscribers;
}

@synthesize subscribers = _subscribers;

- (instancetype)initWithBridger:(RFBridging *)bridger userservice:(NSObject <UserService> * ) userService collectionService:(NSObject <CollectionService> *) collectionService {
    self = [super init];
    if (self) {
        self.bridger = bridger;
        bridger.authorizeDelegate = self;
        bridger.collectionDelegate = self;
        self.userService = userService;
        self.collectionService = collectionService;
    }

    return self;
}

- (void)subscribe:(NSObject <ReactObserver> *)client {
    if ([self.subscribers containsObject:client] == NO) {
        [self.subscribers addObject:client];
    }
}

- (void)didSubmit:(NSString *)username password:(NSString *)password callback:(RCTResponseSenderBlock)callback {
    LoginParameter * parameter = [[LoginParameter alloc] initWithUsername:[username lowercaseString] password:password];
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

- (void)getCollections:(RCTResponseSenderBlock)callback {
    [_collectionService findAll:^(NSArray<FloCollection *> *collections, NSError *error) {
        if (error == nil) {
            NSError *err;
            NSMutableArray * cols = [NSMutableArray new];

            [collections enumerateObjectsUsingBlock:^(FloCollection *floCol, NSUInteger idx, BOOL *stop) {
                [cols addObject:@{@"id":floCol.collectionId, @"name": floCol.collectionName}];
            }];

            NSData *jsonData = [NSJSONSerialization dataWithJSONObject: @{@"collections": cols}
                                                               options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                                 error:&err];

            if (! jsonData) {
                NSLog(@"Got an error: %@", err);
            } else {
                NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                callback(@[[NSNull null],jsonString]);
            }
        } else {
            NSError *err;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject: @{@"collections": @[@{@"id":@"collectionId"}]}
                                                               options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                                 error:&err];

            if (! jsonData) {
                NSLog(@"Got an error: %@", err);
            } else {
                NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                callback(@[[NSNull null],jsonString]);
            }
        }
    }];
}

- (void)signOut {
    [_userService logOut];
}


#pragma mark -

- (NSMutableArray <NSObject <ReactObserver> *> * ) subscribers{
    if (_subscribers == nil) {
        _subscribers = [[NSMutableArray <NSObject <ReactObserver> *> alloc] init];
    }

    return _subscribers;
}

@end