//
//  FirstViewController.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-20.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "welcomeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination) {
        case ("welcomeSegue" , _):
            break
        case ("menuSegue", let navVC as SideMenuNavigationController):
            let settingsVC = navVC.topViewController as! SettingsViewController
            settingsVC.delegate = self
        default:
            print("Unknown segue")
        }
    }
}

extension HomeViewController: SettingsViewControllerDelegate {
    func settingDidPress(setting: Setting, controller: SettingsViewController) {
        switch setting {
        case .catalog:
            print("Go to catalog")
        default:
            print("Do nothing")
        }
    }
}
