//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "FloItemViewModel.h"


@interface KanbanItemViewModel : BaseViewModel <FloItemViewModel>
- (instancetype)initWithKanbanId:(NSString *)kanbanId kanbanName:(NSString *)kanbanName;
@end