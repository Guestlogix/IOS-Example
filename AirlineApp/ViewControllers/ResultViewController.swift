//
//  ResultViewController.swift
//  AirlineApp
//
//  Created by Omar Padierna on 2019-09-21.
//  Copyright © 2019 Omar Padierna. All rights reserved.
//

import Foundation
import TravelerKitUI
import TravelerKit

class ResultViewController: CatalogResultViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination, sender) {
        case (_ , let navVC as UINavigationController, let catalogItem as CatalogItem):
            let vc = navVC.topViewController as? CatalogItemViewController
            vc?.catalogItem = catalogItem
        default:
            print("Unknown segue")
        }
    }

    override func catalogView(_ catalogView: CatalogView, didSelectItemAt indexPath: IndexPath) {
        let catalogItem = catalog!.groups[indexPath.section].items[indexPath.row]

        performSegue(withIdentifier: "itemSegue", sender: catalogItem)
    }
}
