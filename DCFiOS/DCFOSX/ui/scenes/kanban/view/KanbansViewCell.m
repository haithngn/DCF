//
// Created by Hai Nguyen on 2018-12-25.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "KanbansViewCell.h"
#import "FloItemViewModel.h"


@implementation KanbansViewCell {

}

- (void)setModel:(NSObject <FloItemViewModel> *)model {
    _model = model;
    self.textField.stringValue = model.title;
}

@end