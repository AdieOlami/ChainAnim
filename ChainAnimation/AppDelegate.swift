//
//  AppDelegate.swift
//  ChainAnimation
//
//  Created by Olar's Mac on 3/23/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        viewController.view.backgroundColor = .white
        window!.rootViewController = viewController
        window!.makeKeyAndVisible()
        
        return true
    }

}

