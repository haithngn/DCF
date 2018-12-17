//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "Storyboards.h"

@interface Storyboards ()

@property (nonatomic, strong) UIStoryboard * main;

@end

@implementation Storyboards {

@private
    UIStoryboard *_main;
}

@synthesize main = _main;

+ (instancetype)sharedInstance {
    static Storyboards *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[Storyboards alloc] init];
    });

    return sharedInstance;
}

+ (UIStoryboard *)main {
    return [Storyboards sharedInstance].main;
}

- (UIStoryboard *)main {
    if (_main == nil) {
        _main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    return _main;
}

@end