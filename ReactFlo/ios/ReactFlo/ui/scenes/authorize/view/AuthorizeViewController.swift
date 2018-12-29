//
// Created by Hai Nguyen on 2018-12-28.
// Copyright (c) 2018 Facebook. All rights reserved.
//

import Foundation
import UIKit

@objc class AuthorizeViewController: UIViewController {
    var model: AuthorizeViewModel!
    var bridge: RFRCTBridge!
    override func viewDidLoad() {
        super.viewDidLoad()

        model = AuthorizeViewModel(userService: Dependences.userService(), reactService: Dependences.reactService())
        bindData()

        let jsCodeLocationL:URL = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
//      let jsCodeLocationL:URL = Bundle.main.url(forResource: "main", withExtension: "jsbundle")!
        bridge = RFRCTBridge(bundleURL: jsCodeLocationL, moduleProvider: nil, launchOptions: nil)

        let rootView: RCTRootView = RCTRootView(bridge: bridge, moduleName: "ReactFlo", initialProperties: nil)
                //RCTRootView(bundleURL: jsCodeLocationL, moduleName: "ReactFlo", initialProperties: nil)

        self.view.addSubview(rootView)

        rootView.translatesAutoresizingMaskIntoConstraints = false

        let hConstrains = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view": rootView])
        let vConstrains = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": rootView])

        self.view.addConstraints(hConstrains + vConstrains)


    }

    private func bindData() {
        model.onAuthorized = { [weak self] in
            self?.authorized()
        }
    }

    private func authorized() {
        bridge.navigateToMainScreen()
    }
}
