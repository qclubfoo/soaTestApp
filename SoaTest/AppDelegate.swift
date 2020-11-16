//
//  AppDelegate.swift
//  SoaTest
//
//  Created by Дмитрий on 16.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var rootAssembly = RootAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = ViewController.storyboardInstance()
        window?.rootViewController = rootAssembly.presentationAssembly.viewController()
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }



}

