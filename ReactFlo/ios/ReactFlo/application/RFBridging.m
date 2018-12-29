//
// Created by Hai Nguyen on 2018-12-28.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import "RFBridging.h"

@interface RFBridging ()

@end

@implementation RFBridging {

}

+ (instancetype)sharedInstance {
    static RFBridging *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[RFBridging alloc] init];
    });

    return sharedInstance;
}

#pragma mark - Exported Methods

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(submitUsername:(NSString *)username password:(NSString *)password){
    [[RFBridging sharedInstance] onInputUsername:username password:password];
}

#pragma mark - Instance Methods
- (void)onInputUsername:(NSString *)username password:(NSString *)password {
    [_authorizeDelegate didSubmit:username password:password];
}

@end
