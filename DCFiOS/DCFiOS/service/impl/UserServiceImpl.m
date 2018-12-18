//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloRest/FloRest.h>
#import <CoreFlo/CoreFlo.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <FloObjC/FloObjC.h>
#import "UserServiceImpl.h"
#import "AuthorizationApi.h"
#import "BroadcastService.h"
#import "FloUser.h"
#import "LoginParameter.h"

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface UserServiceImpl ()

@property (nonatomic) NSObject <AuthorizationApi> * authorizeApi;
@property (nonatomic) NSObject <SessionRepository> * sessionRepository;
@property (nonatomic, strong) NSMutableArray <NSObject <AuthenticationObserver> *> * authenticationSubscribers;

@end

@implementation UserServiceImpl {
@private
    NSMutableArray<NSObject <AuthenticationObserver> *> *_authenticationSubscribers;
}

- (instancetype)initWithAuthorizeApi:(NSObject <AuthorizationApi> *)authorizeApi sessionRepository:(NSObject <SessionRepository> *) sessionRepository {
    self = [super init];
    if (self) {
        self.authorizeApi = authorizeApi;
        self.sessionRepository = sessionRepository;
    }

    return self;
}

- (void)autoLogin {
    if (_sessionRepository.keyapi != nil) {
        [self announceAuthenticationChanged:[[FloUser alloc] initWithUserId:_sessionRepository.userId
                                                                      email:_sessionRepository.email
                                                                updatedDate:0
                                                                   fullname:@""
                                                             secondaryEmail:@""
                                                                   birthday:0
                                                                     gender:0
                                                                    country:@""
                                                                phoneNumber:@""
                                                                countryCode:@""
                                                                   question:@""
                                                                     answer:@""
                                                             activeSECEmail:0
                                                                     maxUid:0
                                                              activatedPush:0
                                                            quotaLimitBytes:0
                                                                   disabled:0]];
    }
}

- (void)signIn:(LoginParameter *)params complete:(void (^)(FloUser *user, NSError *error))handler {
    [_authorizeApi signIn: params complete:^(FloUser * user, Credentials * credentials, NSError * error){
        if (user != nil) {
            [self.sessionRepository storeWithParams:[[StoreSessionParams alloc] initWithKeyApi:credentials.token
                                                                                        userId:user.userId
                                                                                      password:params.password
                                                                                         email:user.email
                                                                                    expireTime:[NSString stringWithFormat:@"%f", credentials.expireAtInSecond] ]
                                            handler:^(NSError *error) {
                DDLogDebug(@"%@ %@ Error: %@ keyApi %@", THIS_FILE, THIS_METHOD, error, self.sessionRepository.keyapi);
                                                [self announceAuthenticationChanged:user];
            }];
        }
        handler != nil ? handler(user, error) : 0;
    }];
}

- (void)logOut {
    [_sessionRepository clear:^(NSError *error) {
        DDLogError(@"%@ error %@", THIS_METHOD, error);
        [self announceAuthenticationChanged:nil];
    }];
}


- (void)announceAuthenticationChanged:(FloUser *)user {
    [_authenticationSubscribers enumerateObjectsUsingBlock:^(NSObject <AuthenticationObserver> *subcribers, NSUInteger idx, BOOL *stop) {
        [subcribers onChange:user];
    }];
}

- (void)subscribeOnAuthentication:(NSObject <AuthenticationObserver> *)subscriber {
    if ([self.authenticationSubscribers containsObject:subscriber] == NO) {
        [_authenticationSubscribers addObject:subscriber];
    }
}

- (NSMutableArray<NSObject <AuthenticationObserver> *> *)authenticationSubscribers {
    if (_authenticationSubscribers == nil) {
        _authenticationSubscribers = [[NSMutableArray<NSObject <AuthenticationObserver> *> alloc] init];
    }

    return _authenticationSubscribers;
}

@end
