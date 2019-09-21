//
//  AppDelegate.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-20.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import UIKit
import TravelerKit
import TravelerKitUI
import TravelerStripePaymentProvider

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Traveler SDK
        Traveler.initialize(apiKey: Environment.travelerKitKey, device: UIDevice.current)
        TravelerUI.initialize(paymentProvider: StripePaymentProvider(sandBoxModeEnabled: true))
        
        //Theming
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor(red: 13.0 / 255.0, green: 162.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).backgroundColor = .none
        UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = .white
        
        UITabBar.appearance().tintColor = UIColor(red: 13.0 / 255.0, green: 162.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)

        UISegmentedControl.appearance().tintColor = UIColor(red: 13.0 / 255.0, green: 162.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
        return true
    }
    
}

