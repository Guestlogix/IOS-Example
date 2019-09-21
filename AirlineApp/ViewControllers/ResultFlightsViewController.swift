//
//  ResultFlightsViewController.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-21.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import UIKit
import TravelerKit
import TravelerKitUI

class ResultFlightsViewController: UITableViewController {

    var flights: [AirlineFlight]?
    var catalog: Catalog?

    private var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CarouselViewCell", bundle: Bundle(for: CatalogResultViewController.self)), forCellReuseIdentifier: "carouselCell")
        tableView.allowsSelection = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return flights?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return catalog?.groups.count ?? 0
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carouselCell", for: indexPath) as! CarouselViewCell
        cell.delegate = self
        cell.dataSource = self
        cell.moreButton.isHidden = true
        cell.moreButton.isEnabled = false

        if let flight = flights?[indexPath.section] {
            switch(indexPath.row) {
            case 0:
                cell.headerLabel.text = catalog?.groups[indexPath.row].title
                currentIndex = 0
            case 1:
                cell.headerLabel.text = catalog?.groups[indexPath.row].title
                currentIndex = 1
            default:
                break
            }
        }
        cell.tag = indexPath.row
        cell.reload()

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

extension ResultFlightsViewController: CarouselViewCellDelegate, CarouselViewCellDataSource {
    func carouselCellDidPressMoreButton(_ cell: CarouselViewCell) {
        //no-op
    }

    func sizeForItemsInCell(_ cell: CarouselViewCell) -> CGSize {
        let value: CGFloat = 60
        return CGSize(width: (value * 16.0 / 9.0), height: value)
    }

    func identifierForItemsInCell(_ cell: CarouselViewCell) -> String {
        return "carouselCell"
    }

    func carouselCell(_ cell: CarouselViewCell, didSelectItemAt index: Int) {
        //No-op
    }

    func numberOfItemsInCell(_ cell: CarouselViewCell) -> Int {
        return catalog?.groups[currentIndex].items.count ?? 0
    }

    func carouselCell(_ cell: CarouselViewCell, configure: CarouselItemViewCell, at: Int) {
        guard let catalog = catalog else {
            return
        }

        let item = catalog.groups[currentIndex].items[at]

        if let url = item.imageURL {
            AssetManager.shared.loadImage(with: url) { [weak configure] (image) in
                configure?.imageView.image = image
            }
        }

        configure.titleLabel.text = item.title
        configure.subTitleLabel?.text = item.subTitle
    }


}
