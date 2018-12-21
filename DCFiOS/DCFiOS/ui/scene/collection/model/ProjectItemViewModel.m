//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "ProjectItemViewModel.h"

@interface ProjectItemViewModel ()

@property (nonatomic, copy) NSString * projId;
@property (nonatomic, copy) NSString * projName;

@end

@implementation ProjectItemViewModel {

}
- (instancetype)initWithProjectId:(NSString *)projId projectName:(NSString *)projName {
    self = [super init];
    if (self) {
        self.projId = projId;
        self.projName = projName;
    }

    return self;
}

- (NSString *_Nonnull)objectId {
    return _projId;
}

- (NSString *_Nonnull)title {
    return _projName;
}

@end