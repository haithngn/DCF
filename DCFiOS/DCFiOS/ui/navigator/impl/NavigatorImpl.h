//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Navigator.h"


@interface NavigatorImpl : NSObject <Navigator>
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController storyboard:(UIStoryboard *)storyboard;


@end