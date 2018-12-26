//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarksViewCell.h"
#import "FloItemViewModel.h"


@implementation BookmarksViewCell {

}

- (void)setModel:(NSObject <FloItemViewModel> *)model {
    _model = model;
    self.textField.stringValue = model.title;
}

@end