//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@interface MainViewModel : BaseViewModel
@property(nonatomic, copy) void (^onOpenCollection)(NSString *);

- (void)openCollection:(NSString *)collectionId;
@end