//
//  AppDelegate.swift
//  RoboticVacuumCleaner
//
//  Created by Recep Taha Aydın on 7.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let customViewController = MainViewController() // MyCustomViewController sınıfını kullanın
        window?.rootViewController = customViewController
        window?.makeKeyAndVisible()
        return true
    }
}

