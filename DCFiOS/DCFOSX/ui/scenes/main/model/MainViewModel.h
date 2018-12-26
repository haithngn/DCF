//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@interface MainViewModel : BaseViewModel
@property(nonatomic, copy) void (^onOpenCollection)(NSString *);
@property(nonatomic, copy) void (^onOpenKanban)(NSString *);

- (void)openCollection:(NSString *)collectionId;
- (void)openKanban:(NSString *)kanbanId;

@end