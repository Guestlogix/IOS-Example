//
//  FlightsViewController.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-20.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import UIKit
import TravelerKit
import TravelerKitUI

class FlightsViewController: UIViewController {
    
    private var flights: [AirlineFlight]?
    private var catalog: Catalog?
    private var fail: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let departing = AirlineFlight(origin: "Toronto", destination: "Mexico City", time: Date(), code: "AC1980")
        let returning = AirlineFlight(origin: "Mexico City", destination: "Toronto", time: Date(), code: "AC1981")
        flights = [departing, returning]
        let departingFlightQuery = FlightQuery(number: departing.code, date: departing.time)
        fail = false
        Traveler.flightSearch(query: departingFlightQuery, delegate: self)
        performSegue(withIdentifier: "loadingSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination) {
        case (_ , let loadingVC as LoadingFlightsViewController):
            loadingVC.fail = fail
            loadingVC.flights = flights
        case (_, let resultVC as ResultFlightsViewController):
            resultVC.flights = flights
            resultVC.catalog = catalog
        default:
            Log("Unknown segue", data: nil, level: .warning)
        }
    }

}

extension FlightsViewController: FlightSearchDelegate {
    func flightSearchDidSucceedWith(_ result: [Flight]) {
        let catalogQuery = CatalogQuery(flights: result)
        Traveler.fetchCatalog(query: catalogQuery, delegate: self)
    }

    func flightSearchDidFailWith(_ error: Error) {
        performSegue(withIdentifier: "loadingSegue", sender: nil)
        fail = true
    }
}

extension FlightsViewController: CatalogFetchDelegate {
    func catalogFetchDidSucceedWith(_ result: Catalog) {
        catalog = result
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }

    func catalogFetchDidFailWith(_ error: Error) {
        performSegue(withIdentifier: "loadingSegue", sender: nil)
        fail = true
    }
}
