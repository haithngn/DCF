//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FloUser : NSObject

@property (nonatomic, copy) NSString * userId;
@property (nonatomic, copy) NSString * email;
@property (nonatomic, assign) double updatedDate;
@property (nonatomic, copy) NSString * fullname;
@property (nonatomic, copy) NSString * theDescription;
@property (nonatomic, copy) NSString * secondaryEmail;
@property (nonatomic, assign) NSInteger birthday;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, copy) NSString * country;
@property (nonatomic, copy) NSString * phoneNumber;
@property (nonatomic, copy) NSString * countryCode;
@property (nonatomic, copy) NSString * question;
@property (nonatomic, copy) NSString * answer;
@property (nonatomic, assign) NSInteger activeSECEmail;
@property (nonatomic, assign) NSInteger maxUid;
@property (nonatomic, assign) NSInteger activatedPush;
@property (nonatomic, assign) NSInteger quotaLimitBytes;
@property (nonatomic, assign) NSInteger disabled;

- (instancetype)initWithUserId:(NSString *)userId email:(NSString *)email updatedDate:(double)updatedDate
                      fullname:(NSString *)fullname
                secondaryEmail:(NSString *)secondaryEmail birthday:(NSInteger)birthday gender:(NSInteger)gender
                       country:(NSString *)country phoneNumber:(NSString *)phoneNumber
                   countryCode:(NSString *)countryCode
                      question:(NSString *)question answer:(NSString *)answer activeSECEmail:(NSInteger)activeSECEmail
                        maxUid:(NSInteger)maxUid activatedPush:(NSInteger)activatedPush
               quotaLimitBytes:(NSInteger)quotaLimitBytes disabled:(NSInteger)disabled;


@end