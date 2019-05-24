//
//  ListCitiesCell.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 24/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Foundation
import UIKit

class ListCitiesCell: UITableViewCell {
    
    @IBOutlet var cityName: UILabel!
    
    func configure(name: String) {
        
        cityName.text = name
    }
}
