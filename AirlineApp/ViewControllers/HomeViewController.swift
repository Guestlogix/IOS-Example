//
//  FirstViewController.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-20.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import UIKit
import SideMenu
import TravelerKit

class HomeViewController: UIViewController {

    private var query = CatalogQuery(flights: nil)
    private var resultCatalog: Catalog?

    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "welcomeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination) {
        case (_ , let retryVC as RetryViewController):
            retryVC.delegate = self
        case (_ , let resultVC as ResultViewController):
            resultVC.catalog = resultCatalog
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
            Traveler.fetchCatalog(query: query, delegate: self)
            performSegue(withIdentifier: "loadingSegue", sender: nil)
        default:
            print("Do nothing")
        }
    }
}

extension HomeViewController: CatalogFetchDelegate {
    func catalogFetchDidSucceedWith(_ result: Catalog) {
        resultCatalog = result
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }

    func catalogFetchDidFailWith(_ error: Error) {
        performSegue(withIdentifier: "errorSegue", sender: nil)
    }
}

extension HomeViewController: RetryViewControllerDelegate {
    func retryViewControllerDidRetry(_ controller: RetryViewController) {
        Traveler.fetchCatalog(query: query, delegate: self)
        performSegue(withIdentifier: "loadingSegue", sender: nil)
    }
}
