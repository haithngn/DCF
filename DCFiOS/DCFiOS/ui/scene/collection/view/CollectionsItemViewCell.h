//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTableViewCell.h"

@protocol FloItemViewModel;


@interface CollectionsItemViewCell : BaseTableViewCell
@property (nonatomic, strong) NSObject <FloItemViewModel> * model;
@end