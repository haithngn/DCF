//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseOSXTableViewCell.h"

@protocol FloItemViewModel;

@interface BookmarksViewCell : BaseOSXTableViewCell

@property(nonatomic, strong) NSObject <FloItemViewModel> *model;

@end