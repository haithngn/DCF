//
// Created by Hai Nguyen on 2018-12-20.
// Copyright (c) 2018 Hai Nguyen. All rights reserved.
//

import Foundation
import PageMenu
import DCFiOS


@objc class CollectionViewController: UIViewController {
    var pageMenu : CAPSPageMenu?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // MARK: - UI Setup

        self.title = "PAGE MENU"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<-", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.didTapGoToLeft))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "->", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.didTapGoToRight))

        // MARK: - Scroll menu setup

        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []

        let controller1 : HomeViewController = TestTableViewController(nibName: "TestTableViewController", bundle: nil)
        controller1.title = "FRIENDS"
        controllerArray.append(controller1)
        let controller2 : HomeViewController = TestCollectionViewController(nibName: "TestCollectionViewController", bundle: nil)
        controller2.title = "MOOD"
        controllerArray.append(controller2)
        let controller3 : HomeViewController = TestViewController(nibName: "TestViewController", bundle: nil)
        controller3.title = "MUSIC"
        controllerArray.append(controller3)
        let controller4 : HomeViewController = TestViewController(nibName: "TestViewController", bundle: nil)
        controller4.title = "FAVORITES"
        controllerArray.append(controller4)

        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .selectionIndicatorColor(UIColor.orange),
            .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .menuHeight(40.0),
            .menuItemWidth(90.0),
            .centerMenuItems(true)
        ]

        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)

        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)

        pageMenu!.didMove(toParentViewController: self)
    }
}
