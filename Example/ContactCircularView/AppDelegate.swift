//
//  AppDelegate.swift
//  ContactCircularView
//
//  Created by Kamil Wysocki on 07/17/2016.
//  Copyright (c) 2016 Kamil Wysocki. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject:AnyObject]?) -> Bool {
        window = UIWindow()
        window?.frame = UIScreen.mainScreen().bounds
        let viewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

