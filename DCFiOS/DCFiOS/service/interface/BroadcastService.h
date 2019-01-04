//
// Created by Hai Nguyen on 2018-12-17.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FloUser;

@protocol AuthenticationObserver <NSObject>
@required
- (void)onChange:(FloUser *) user;
@end

@protocol BroadcastService <NSObject>
@required
- (void)subscribeOnAuthentication:(NSObject <AuthenticationObserver>*)subscriber;
@end