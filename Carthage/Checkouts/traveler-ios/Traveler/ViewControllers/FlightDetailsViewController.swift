//
//  FlightDetailsViewController.swift
//  Traveler
//
//  Created by Dorothy Fu on 2019-02-28.
//  Copyright © 2019 GuestLogix. All rights reserved.
//

import UIKit
import TravelerKit

class FlightDetailsViewController: UIViewController {
    @IBOutlet weak var departureCityLabel: UILabel!
    @IBOutlet weak var arrivalCityLabel: UILabel!
    @IBOutlet weak var departureIATALabel: UILabel!
    @IBOutlet weak var arrivalIATALabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var flightNumberLabel: UILabel!
    @IBOutlet weak var flightDateLabel: UILabel!
    
    var flight: Flight?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let flight = flight else {
            Log("No selected flight", data: nil, level: .error)
            return
        }
        
        departureCityLabel.text = flight.departureAirport.city
        departureIATALabel.text = flight.departureAirport.code
        departureTimeLabel.text = flight.departureDate.description(with: flight.departureAirport.timeZone, formatter: DateFormatter.timeFormatter)
        arrivalCityLabel.text = flight.arrivalAirport.city
        arrivalIATALabel.text = flight.arrivalAirport.code
        arrivalTimeLabel.text = flight.arrivalDate.description(with: flight.arrivalAirport.timeZone, formatter: DateFormatter.timeFormatter)
        flightNumberLabel.text = flight.number
        flightDateLabel.text = flight.departureDate.description(with: flight.departureAirport.timeZone, formatter: DateFormatter.longFormatter)
        flightNumberLabel.textColor = .white
        flightDateLabel.textColor = .white
    }

    @IBAction func didClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}