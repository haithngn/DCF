//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserServiceImpl.h"

@interface UserServiceTests : XCTestCase

@property (nonatomic, strong) UserServiceImpl * userService;

@end

@implementation UserServiceTests {

}

- (void)setUp {
    [super setUp];

    _userService = [[UserServiceImpl alloc] initWithAuthorizeApi:nil sessionRepository:nil];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Test Authorization

- (void)testProtectInputs{

}

@end
