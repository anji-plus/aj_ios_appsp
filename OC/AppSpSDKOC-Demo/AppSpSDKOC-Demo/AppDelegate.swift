//
//  AppDelegate.swift
//  AppSpSDKOC-Demo
//
//  Created by 李家斌 on 2021/2/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let VC = ViewController()
        VC.view.backgroundColor = UIColor.white
        let Nav = UINavigationController(rootViewController: VC)
        Nav.navigationBar.isTranslucent = false
        self.window?.rootViewController = Nav
        
        return true
    }


}

