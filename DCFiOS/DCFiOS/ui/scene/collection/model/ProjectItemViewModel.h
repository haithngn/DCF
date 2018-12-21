//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FloItemViewModel.h"


@interface ProjectItemViewModel : NSObject <FloItemViewModel>
- (instancetype)initWithProjectId:(NSString *)projId projectName:(NSString *)projName;


@end