//
// Created by Hai Nguyen on 2018-12-28.
// Copyright (c) 2018 Facebook. All rights reserved.
//

import Foundation

@objc class AuthorizeViewModel: NSObject, RFBridgingAuthorizeDelegate {
    func didSubmit(_ username: String!, password: String!) {
        debugPrint("\(username) \(password)")
    }
}
