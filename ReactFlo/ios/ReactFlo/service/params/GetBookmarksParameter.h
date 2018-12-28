//
// Created by Hai Nguyen Thanh on 2018-12-21.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
    @objc public var pItem:Int
    @objc public var minId:String
    @objc public var modifiedGTE: NSNumber?
    @objc public var ids:[String]?
    @objc public var hasDel:Bool
    @objc public var userId: String
 * */

@interface GetBookmarksParameter : NSObject
@property(nonatomic, copy) NSString *userId;
@property(nonatomic) NSInteger pItem;
@property(nonatomic, copy) NSString *minId;
@property(nonatomic, strong) NSNumber *modifiedGTE;
@property(nonatomic, strong) NSArray <NSString*> * ids;
@property(nonatomic, assign) BOOL hasDel;

- (instancetype)initWithUserId:(NSString *)userId pItem:(NSInteger)pItem minId:(NSString *)minId modifiedGTE:(NSNumber *)modifiedGTE ids:(NSArray<NSString *> *)ids hasDel:(BOOL)hasDel;

@end