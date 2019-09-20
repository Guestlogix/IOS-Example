//
//  AppDelegate.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-20.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Traveler SDK
        
        //Theming
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor(red: 13.0 / 255.0, green: 162.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        UIButton.appearance().backgroundColor = UIColor(red: 13.0 / 255.0, green: 162.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
        UIButton.appearance().tintColor = UIColor.white
        UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).backgroundColor = .none
        
        UITabBar.appearance().tintColor = UIColor(red: 13.0 / 255.0, green: 162.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
        return true
    }
    
}

