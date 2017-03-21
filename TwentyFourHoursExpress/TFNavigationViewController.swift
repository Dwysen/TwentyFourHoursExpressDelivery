//
//  MCNavigationViewController.swift
//  MasterClub
//
//  Created by apple on 17/2/13.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class TFNavigationViewController: UINavigationController {

    internal override class func initialize(){
        super.initialize()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = GreenColor()
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 20),  NSForegroundColorAttributeName:UIColor.white]
    }

//    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//            if viewControllers.count == 0  {
//                viewController.hidesBottomBarWhenPushed = true
//    //            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .Plain, target: self, action: #selector(navigationBackClick))
//    //        }
//            super.pushViewController(viewController, animated: true)
//        }
//    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
}
