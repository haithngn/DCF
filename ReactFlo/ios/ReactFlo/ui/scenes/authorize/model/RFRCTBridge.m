//
// Created by Hai Nguyen Thanh on 2018-12-29.
// Copyright (c) 2018 Facebook. All rights reserved.
//

#import "RFRCTBridge.h"


@implementation RFRCTBridge {

}

- (instancetype)initWithBundleURL:(NSURL *)bundleURL moduleProvider:(RCTBridgeModuleListProvider)block launchOptions:(NSDictionary *)launchOptions {
    self = [super initWithBundleURL:bundleURL moduleProvider:block launchOptions:launchOptions];
    if (self) {

    }

    return self;
}

- (void)navigateToMainScreen {
    [self enqueueJSCall:@"ReactFlo._authorized" args:@[]];
    NSLog(@"navigateToMainScreen");
}


@end