//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseOSXTableViewCell.h"

@protocol FloItemViewModel;

@interface CollectionsViewCell : BaseOSXTableViewCell
@property(nonatomic, weak) NSObject <FloItemViewModel> *model;

@end