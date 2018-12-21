//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"

@protocol KanbanNavigations;

@protocol NavigationsDelegate <NSObject>
@required
- (void)didSelectKanbanWithId:(NSString * _Nonnull) kanbanId;

@end

@interface NavigationsViewController : BaseViewController <KanbanNavigations>
@property (nonatomic, weak) NSObject <NavigationsDelegate> *delegate;

@end