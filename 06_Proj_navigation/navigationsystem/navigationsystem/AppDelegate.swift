//
//  AppDelegate.swift
//  navigationsystem
//
//  Created by thusitha on 7/25/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let mainVC = CustomViewController()
//        let navigationVC = UINavigationController(rootViewController: mainVC)
//        window?.rootViewController = navigationVC
//        window?.makeKeyAndVisible()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main) //Settings
        let viewController = storyboard.instantiateInitialViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

