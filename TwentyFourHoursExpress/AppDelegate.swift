//
//  AppDelegate.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  
        self.window = UIWindow(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        self.window?.makeKeyAndVisible()
        
        setupTabBar()
        
        return true
    }
    
    private func setupTabBar(){
        
        let tabbarController = UITabBarController()
        
        let homeController = TFNavigationViewController(rootViewController: HomeViewController())

      
//        let servicePointController = TFNavigationViewController(rootViewController: MeViewController())
        let sendExpressController = TFNavigationViewController(rootViewController: SendExpressViewController())
        let claimController = ClaimViewController()
        let meController = TFNavigationViewController(rootViewController:  MeViewController())
        
        
        tabbarController.viewControllers = [homeController,sendExpressController,claimController,meController]
        
        let tabbarItem1 = UITabBarItem(title: "首页", image: UIImage(named: "CD"), selectedImage: UIImage(named: "CD"))
        let tabbarItem2 = UITabBarItem(title: "寄件", image: UIImage(named: "CD"), selectedImage: UIImage(named: "CD"))
        let tabbarItem3 = UITabBarItem(title: "理赔", image: UIImage(named: "CD"), selectedImage: UIImage(named: "CD"))
        let tabbarItem4 = UITabBarItem(title: "我的", image: UIImage(named: "CD"), selectedImage: UIImage(named: "CD"))
        
        
        homeController.tabBarItem = tabbarItem1
        sendExpressController.tabBarItem = tabbarItem2
        claimController.tabBarItem = tabbarItem3
        meController.tabBarItem = tabbarItem4
        
        //        homeController.tabBarController?.tabBar.tintColor = UIColor.red
        self.window?.rootViewController = tabbarController
        
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

