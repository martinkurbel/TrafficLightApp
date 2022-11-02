//
//  AppDelegate.swift
//  Traffic light
//
//  Created by Martin Kurbel on 02/11/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let nc = UINavigationController()
        nc.setViewControllers([MenuViewController()], animated: false)
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        
        return true
    }
}
