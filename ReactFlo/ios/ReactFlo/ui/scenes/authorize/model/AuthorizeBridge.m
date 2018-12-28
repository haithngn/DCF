//
// Created by Hai Nguyen on 2018-12-28.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import "AuthorizeBridge.h"


@implementation AuthorizeBridge {

}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(submitUsername:(NSString *)username password:(NSString *)password){
    NSLog(@"Pretending to create an event %@ at %@", username, password);
}

@end
