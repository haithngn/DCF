//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <FloObjC/FloObjC.h>
#import "FloUser.h"
#import "LoginParameter.h"


@implementation FloUser {

}

- (instancetype)initWithUserId:(NSString *)userId email:(NSString *)email updatedDate:(double)updatedDate
                      fullname:(NSString *)fullname
                secondaryEmail:(NSString *)secondaryEmail birthday:(NSInteger)birthday gender:(NSInteger)gender
                       country:(NSString *)country phoneNumber:(NSString *)phoneNumber
                   countryCode:(NSString *)countryCode
                      question:(NSString *)question answer:(NSString *)answer activeSECEmail:(NSInteger)activeSECEmail
                        maxUid:(NSInteger)maxUid activatedPush:(NSInteger)activatedPush
               quotaLimitBytes:(NSInteger)quotaLimitBytes disabled:(NSInteger)disabled {
    self = [super init];
    if (self) {
        self.userId = userId;
        self.email = email;
        self.updatedDate = updatedDate;
        self.fullname = fullname;
        self.secondaryEmail = secondaryEmail;
        self.birthday = birthday;
        self.gender = gender;
        self.country = country;
        self.phoneNumber = phoneNumber;
        self.countryCode = countryCode;
        self.question = question;
        self.answer = answer;
        self.activeSECEmail = activeSECEmail;
        self.maxUid = maxUid;
        self.activatedPush = activatedPush;
        self.quotaLimitBytes = quotaLimitBytes;
        self.disabled = disabled;
    }

    return self;
}

@end