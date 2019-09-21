//
//  LoadingFlightsViewController.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-21.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import UIKit

class LoadingFlightsViewController: UITableViewController {

    var flights: [AirlineFlight]?
    var fail: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return flights?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
        case 0:
            sectionName = "First Flight"
        case 1:
            sectionName = "Second Flight"
        default:
            sectionName = ""
        }
        return sectionName
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell", for: indexPath) as! FlightCell
        if let flight = flights?[indexPath.section] {
            switch(indexPath.row) {
            case 0:
                cell.label.text = flight.origin
            case 1:
                cell.label.text = flight.destination
            default:
                break
            }
        }

        if fail == true {
            cell.activityIndicator.stopAnimating()
        } else {
            cell.activityIndicator.startAnimating()
        }

        return cell
    }

}
