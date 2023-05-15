//
//  AppDelegate.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

 
    var window: UIWindow?
    var navigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let homeScreenCoordinator = HomeScreenCoordinator(navigationController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeScreenCoordinator.navigationController
        window?.makeKeyAndVisible()
        homeScreenCoordinator.start()
        return true
    }



}

