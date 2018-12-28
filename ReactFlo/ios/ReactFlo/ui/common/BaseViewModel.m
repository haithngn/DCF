//
// Created by Hai Nguyen on 2018-12-12.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BaseViewModel.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@implementation BaseViewModel {

}

- (void)dealloc {
    DDLogDebug(@"%@ dealocing....", THIS_FILE);
}


@end
