//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloRest/FloRest.h>
#import <FloObjC/FloObjC.h>
#import "AuthorizationApiImpl.h"
#import "LoginParameter.h"
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


- (void)signIn:(LoginParameter *)params complete:(void (^)(FloUser *, Credentials * credentials, NSError *))handler {
    [_api loginWithParams: [[LoginParams alloc] initWithUsername:params.username password:params.password] succeed: ^(User * user, Credentials * credentials){
        FloUser * floUser = [[FloUser alloc] initWithUserId:user.id
                email:user.email updatedDate:user.updatedDate fullname:user.fullname secondaryEmail:user.secondaryEmail
                                                   birthday:user.birthday gender:user.gender country:user.country
                                                phoneNumber:user.phonenumber countryCode:user.countryCode
                                                   question:user.question
                                                     answer:user.answer activeSECEmail:user.activeSecondEmail maxUid:user.maxUid
                                              activatedPush:user.activatedPush quotaLimitBytes:user.quotaLimitBytes disabled:user.disabled];
        handler ? handler(floUser, credentials, nil) : 0;
    } failure: ^(id error){
        handler!= nil ? handler(nil, nil, error) : 0;
    }];
}

@end
