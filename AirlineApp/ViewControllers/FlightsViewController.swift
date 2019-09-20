//
//  FlightsViewController.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-20.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import UIKit

class FlightsViewController: UITableViewController {
    
    private var flights: [AirlineFlight]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let departing = AirlineFlight(origin: "Toronto", destination: "Mexico City", time: Date(), code: "AC1980")
        let returning = AirlineFlight(origin: "Mexico City", destination: "Toronto", time: Date(), code: "AC1981")
        flights = [departing, returning]
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return flights?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
        case 0:
            sectionName =  "First flight"
        case 1:
            sectionName = "Second flight"
        default:
            sectionName = ""
        }
        
        return sectionName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
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
        
        return cell
    }
}
