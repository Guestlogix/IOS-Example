//
//  SettingsViewController.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-20.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import UIKit

enum Setting: String {
    case login = "Login"
    case catalog = "Book a tour"
}

protocol SettingsViewControllerDelegate: class {
    func settingDidPress(setting: Setting, controller: SettingsViewController)
}

class SettingsViewController: UITableViewController {

    public var delegate: SettingsViewControllerDelegate?

    private var settingOptions: [Setting]?

    override func viewDidLoad() {
        super.viewDidLoad()
        settingOptions = [.catalog, .login]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingOptions?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsCell
        cell.label.text = settingOptions?[indexPath.row].rawValue
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let settingOption = settingOptions?[indexPath.row] {
            dismiss(animated: true) { [weak delegate] in
                delegate?.settingDidPress(setting: settingOption, controller: self)
            }
        }
    }

}
