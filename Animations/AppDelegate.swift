//
//  AppDelegate.swift
//  Animations
//
//  Created by Cyril on 13/04/17.
//  Copyright © 2017 Cyril. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        let navVC = AnimationsNavigationController(rootViewController: AnimationsRootVC())
        self.window = UIWindow()
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
        
        return true
    }

   }

