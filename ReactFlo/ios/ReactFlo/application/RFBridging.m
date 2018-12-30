//
// Created by Hai Nguyen on 2018-12-28.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import "RFBridging.h"

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

RCT_EXPORT_METHOD(submitUsername:(NSString *)username password:(NSString *)password callback:(RCTResponseSenderBlock)callback){
    [[RFBridging sharedInstance] onInputUsername:username password:password callback:callback];
}

RCT_EXPORT_METHOD(getCollections:(RCTResponseSenderBlock)callback){
    [[RFBridging sharedInstance] fetchCollections:callback];
}

RCT_EXPORT_METHOD(signOut){
    [[RFBridging sharedInstance] logout];
}

#pragma mark - Instance Methods
- (void)onInputUsername:(NSString *)username password:(NSString *)password callback:(RCTResponseSenderBlock)callback {
    [_authorizeDelegate didSubmit:username password:password callback: callback];
}

- (void)fetchCollections:(RCTResponseSenderBlock)callback {
    if (_collectionDelegate == nil) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject: @{@"error": @[@{@"id":@"collectionId"}]}
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];

        if (! jsonData) {
            NSLog(@"Got an error: %@", error);
        } else {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            callback(@[jsonString,jsonString]);
        }
    } else {
        [_collectionDelegate getCollections:callback];
    }
}

- (void)logout{
    [_authorizeDelegate signOut];
}

@end
