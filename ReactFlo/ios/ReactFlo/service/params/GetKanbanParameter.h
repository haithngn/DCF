//
// Created by Hai Nguyen on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 @objc public var pItem: NSNumber?
    @objc public var minId: String?
    @objc public var hasDelete: NSNumber?
    @objc public var modifiedGTE : NSNumber?
    @objc public var userId: String
 * */

@interface GetKanbanParameter : NSObject
@property (nonatomic, readonly) NSString * userId;
@property (nonatomic, readonly) NSNumber * pItem;
@property (nonatomic, readonly) NSString * minId;
@property (nonatomic, readonly) BOOL hasDelete;
@property (nonatomic, readonly) NSNumber * modifiedGTEInSecond;

- (instancetype)initWithUserId:(NSString *)userId pItem:(NSNumber *)pItem minId:(NSString *)minId
                     hasDelete:(BOOL)hasDelete modifiedGTEInSecond:(NSNumber *)modifiedGTEInSecond;

@end
