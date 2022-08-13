//
//  AppDelegate.swift
//  Instagram-Swift
//
//  Created by hakkı can şengönül on 13.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = MainController()
        window?.makeKeyAndVisible()
        return true
    }
    
    
}

