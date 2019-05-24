//
//  DailySummaryCell.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 23/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Foundation
import UIKit

class DailySummaryCell: UITableViewCell {
    
    @IBOutlet var dailySummary: UILabel!
    
    func configure(cityData weatherData: WeatherData?) {
        
        dailySummary.text = weatherData?.daily.summary
    }
}
