//
// Created by Hai Nguyen on 2018-12-28.
// Copyright (c) 2018 Facebook. All rights reserved.
//

import Foundation

@objc class AuthorizeViewModel: NSObject, ReactObserver {
    var reactService: ReactService
    var userService: UserService

    var onAuthorized: (() -> ())?

    init(userService: UserService, reactService: ReactService) {
        self.reactService = reactService
        self.userService = userService
        super.init()
        reactService.subscribe(self)
    }

    func didSubmit(_ username: String!, password: String!) {
        if let usr = username, let pwd = password {
            let params: LoginParameter = LoginParameter(username: usr, password: pwd)
            userService.sign(in: params) { [weak self] (user: FloUser!, error: Error!) in
                self?.onAuthorized?()
            }
        }
    }
}
