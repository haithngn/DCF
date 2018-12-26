//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserServiceImpl.h"
#import "AuthorizeApiMock.h"
#import "LoginParameter.h"

@interface UserServiceTests : XCTestCase

@property (nonatomic, strong) UserServiceImpl * userService;
@property (nonatomic, strong) AuthorizeApiMock * authorizeApi;

@end

@implementation UserServiceTests {

}

- (void)setUp {
    [super setUp];

    _authorizeApi = [[AuthorizeApiMock alloc] init];
    _userService = [[UserServiceImpl alloc] initWithAuthorizeApi:_authorizeApi sessionRepository:nil];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Test Authorization

- (void)testProtectInputs{
    //Given
    NSString * usr = @"vocungaodieu";
    NSString * pwd = @"aodieuvocung";
    LoginParameter * parameter = [[LoginParameter alloc] initWithUsername:usr password:pwd];

    //When
    [_userService signIn:parameter complete:nil];

    //Then
    XCTAssertEqual(usr, _authorizeApi.username, @"Parameter(username) must be keep during submit to the api");
    XCTAssertEqual(pwd, _authorizeApi.password, @"Parameter(password) must be keep during submit to the api");
}

@end
