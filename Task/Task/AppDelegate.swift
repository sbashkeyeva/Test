//
//  AppDelegate.swift
//  Task
//
//  Created by Symbat Bashkeyeva on 6/8/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
//        let flowLayout = UICollectionViewFlowLayout()
//        let customCollectionViewController = VC(collectionViewLayout: flowLayout)
        let viewController = VC()
        window?.rootViewController = UINavigationController(rootViewController:viewController)
        return true
    }
}

