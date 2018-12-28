//
// Created by Hai Nguyen on 2018-12-28.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@protocol RFBridgingAuthorizeDelegate <NSObject>
@required
- (void)didSubmit:(NSString *)username password:(NSString *)password;

@end

@interface RFBridging : NSObject <RCTBridgeModule>

@property (nonatomic, weak) NSObject <RFBridgingAuthorizeDelegate> * authorizeDelegate;

+ (instancetype)sharedInstance;

@end
