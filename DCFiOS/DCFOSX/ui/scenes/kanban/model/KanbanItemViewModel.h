//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FloItemViewModel.h"


@interface KanbanItemViewModel : NSObject <FloItemViewModel>

- (instancetype)initWithKanbanId:(NSString *)kanbanId kanbanName:(NSString *)kanbanName;

@end