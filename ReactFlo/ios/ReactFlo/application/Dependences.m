//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloRest/FloRest.h>
#import <FloObjC/FloObjC.h>
#import "Dependences.h"
#import "UserService.h"
#import "UserServiceImpl.h"
#import "AuthorizationApiImpl.h"
#import "BroadcastService.h"
#import "BroadcastServiceImpl.h"
#import "CollectionService.h"
#import "CollectionServiceImpl.h"
#import "CollectionApiImpl.h"
#import "KanbanService.h"
#import "KanbanApi.h"
#import "KanbanServiceImpl.h"
#import "KanbanApiImpl.h"
#import "BookmarkService.h"
#import "BookmarkApi.h"
#import "BookmarkApiImpl.h"
#import "BookmarkServiceImpl.h"

@class FloKanbanApi;
@class FloBookmarkApi;

@interface Dependences ()

@property (nonatomic, strong) FloConfigurations * config;
@property (nonatomic, strong) NSObject <UserService> * userService;
@property (nonatomic, strong) NSObject <AuthorizationApi> * authorizationApi;
@property (nonatomic, strong) NSObject <BroadcastService> * broadcastService;
@property (nonatomic, strong) NSObject <CollectionService> * collectionService;
@property (nonatomic, strong) NSObject <CollectionApi> * collectionApi;
@property (nonatomic, strong) NSObject <KanbanApi> * kanbanApi;
@property (nonatomic, strong) NSObject <KanbanService> * kanbanService;
@property (nonatomic, strong) NSObject <BookmarkApi> * bookmarkApi;
@property (nonatomic, strong) NSObject <BookmarkService> * bookmarkService;

@end

@implementation Dependences {
@private
    NSObject <UserService> *_userService;
    NSObject <AuthorizationApi> *_authorizationApi;
    FloConfigurations *_config;
    NSObject <BroadcastService> *_broadcastService;
    NSObject <CollectionService> *_collectionService;
    NSObject <CollectionApi> *_collectionApi;
    NSObject <KanbanService> *_kanbanService;
    NSObject <BookmarkApi> *_bookmarkApi;
    NSObject <BookmarkService> *_bookmarkService;
}

@synthesize userService = _userService;
@synthesize authorizationApi = _authorizationApi;
@synthesize config = _config;
@synthesize broadcastService = _broadcastService;
@synthesize collectionService = _collectionService;
@synthesize collectionApi = _collectionApi;
@synthesize kanbanService = _kanbanService;
@synthesize bookmarkApi = _bookmarkApi;
@synthesize bookmarkService = _bookmarkService;

+ (instancetype)sharedInstance {
    static Dependences *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[Dependences alloc] init];
    });

    return sharedInstance;
}

+ (FloConfigurations *)configurations {
    return [Dependences sharedInstance].config;
}

+ (NSObject <UserService> *)userService {
    return [Dependences sharedInstance].userService;
}

- (FloConfigurations *)config {
    if (_config == nil) {
        _config = [[FloConfigurations alloc] init];
    }
    return _config;
}

#pragma mark - Class Properties
+ (NSObject <BroadcastService> *)broadcastService {
    return [Dependences sharedInstance].broadcastService;
}

+ (NSObject <CollectionService> *)collectionService {
    return [Dependences sharedInstance].collectionService;
}

+ (NSObject <KanbanService> *)kanbanService {
    return [Dependences sharedInstance].kanbanService;;
}

#pragma mark - Instance Properties

+ (NSObject <BookmarkService>*)bookmarkService {
    return [Dependences sharedInstance].bookmarkService;
}

- (NSObject <UserService> *)userService {
    if (_userService == nil) {
        _userService = [[UserServiceImpl alloc] initWithAuthorizeApi:self.authorizationApi sessionRepository:[[FloSessionRepository alloc] init]];
    }

    return _userService;
}

- (NSObject <AuthorizationApi> *)authorizationApi {
    if (_authorizationApi == nil) {
        _authorizationApi = [[AuthorizationApiImpl alloc] initWithApi:[[FloAuthenticationApi alloc] init] ];
    }
    return _authorizationApi;
}

- (NSObject <BroadcastService> *)broadcastService {
    if (_broadcastService == nil) {
        _broadcastService = [[BroadcastServiceImpl alloc] initWithersUserService:self.userService];
    }

    return _broadcastService;
}

- (NSObject <CollectionApi> *)collectionApi {
    if (_collectionApi == nil) {
        _collectionApi = [[CollectionApiImpl alloc] initWithApi:[[FloCollectionApi alloc] init] ];
    }
    return _collectionApi;
}

- (NSObject <CollectionService> *)collectionService {
    if (_collectionService == nil) {
        _collectionService = [[CollectionServiceImpl alloc] initWithCollectionApi:self.collectionApi];
    }

    return _collectionService;
}

- (NSObject <KanbanApi> *)kanbanApi {
    if (_kanbanApi == nil) {
        _kanbanApi = [[KanbanApiImpl alloc] initWithApi:[[FloKanbanApi alloc] init] ];
    }

    return _kanbanApi;
}

- (NSObject <KanbanService> *)kanbanService {
    if (_kanbanService == nil) {
        _kanbanService = [[KanbanServiceImpl alloc] initWithCollectionApi:self.kanbanApi];
    }

    return _kanbanService;
}

- (NSObject <BookmarkApi> *)bookmarkApi {
    if (_bookmarkApi == nil) {
        _bookmarkApi = [[BookmarkApiImpl alloc] initWithApi:[[FloBookmarkApi alloc] init] ];
    }

    return _bookmarkApi;
}

- (NSObject <BookmarkService> *)bookmarkService {
    if (_bookmarkService == nil) {
        _bookmarkService = [[BookmarkServiceImpl alloc] initWithBookmarkApi:self.bookmarkApi];
    }

    return _bookmarkService;
}

@end
