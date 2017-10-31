//
//  AppDelegate.swift
//  testApp Vesti Reader
//
//  Created by Zakirzhan Aisabaev on 31.10.17.
//  Copyright © 2017 Zakirzhan Aisabaev. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = ViewController()
        let nc = UINavigationController(rootViewController: ViewController())
        nc.navigationBar.isTranslucent = false
        nc.navigationBar.tintColor = .white
        nc.navigationBar.barStyle = UIBarStyle.black
        nc.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        nc.navigationBar.shadowImage = UIImage() 
         nc.navigationBar.barTintColor = Macros.GlobalColors.bgColor
        window?.rootViewController = nc 
        window?.makeKeyAndVisible()
        return true
    }
}
