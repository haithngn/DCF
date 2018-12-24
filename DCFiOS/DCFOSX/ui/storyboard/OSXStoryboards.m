//
// Created by Hai Nguyen on 2018-12-24.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "OSXStoryboards.h"

@interface OSXStoryboards ()

@property (nonatomic, strong) NSStoryboard * main;

@end

@implementation OSXStoryboards {

@private
    NSStoryboard *_main;
}

@synthesize main = _main;

+ (instancetype)sharedInstance {
    static OSXStoryboards *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[OSXStoryboards alloc] init];
    });

    return sharedInstance;
}

- (NSStoryboard *)main {
    if (_main == nil) {
        _main = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    }

    return _main;
}

+ (NSStoryboard *)main {
    return [OSXStoryboards sharedInstance].main;
}


@end
