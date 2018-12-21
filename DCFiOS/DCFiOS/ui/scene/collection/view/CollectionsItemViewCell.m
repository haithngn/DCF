//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "CollectionsItemViewCell.h"
#import "FloItemViewModel.h"


@implementation CollectionsItemViewCell {

}
- (void)setModel:(NSObject <FloItemViewModel> *)model {
    _model = model;
    self.textLabel.text = model.title;
}

@end