//
// Created by Hai Nguyen on 2018-12-26.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

#import "BookmarkOSXViewController.h"
#import "BookmarkViewModel.h"
#import "Dependences.h"
#import <WebKit/WebKit.h>

@interface BookmarkOSXViewController ()

@property (nonatomic, strong) BookmarkViewModel * model;
@property (nonatomic, weak) IBOutlet WKWebView *webView;

@end

@implementation BookmarkOSXViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[BookmarkViewModel alloc] initWithBookmarkService:[Dependences bookmarkService] bookmarkId:_bookmarkId];

    [self bindData];
    [_model load];
}

- (void)bindData {
    __weak typeof(self) weakSelf = self;
    
    _model.onUrl = ^(NSString * urlInString){
        [weakSelf.webView loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:urlInString]]];
    };
    
    _model.onError = ^(NSString * message){
        [weakSelf showMessage:message confirmButtonTitle:@"Close" onConfirmed:nil];
    };
}

@end
