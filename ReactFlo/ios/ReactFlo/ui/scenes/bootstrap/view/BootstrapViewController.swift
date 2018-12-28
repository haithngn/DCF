//
//  BootstrapViewController.swift
//  ReactFlo
//
//  Created by Hai Nguyen on 12/28/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation
import UIKit

@objc class BootstrapViewController: UINavigationController {
    var model: BootstrapViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        model = BootstrapViewModel(broadcastService: Dependences.broadcastService(), userService: Dependences.userService())
        bindData()

        model.autoLogin()
    }

    private func bindData() {
        model.onSignedIn = { [weak self] in

        }

        model.onSignedOut = { [weak self] in

        }
    }
}
