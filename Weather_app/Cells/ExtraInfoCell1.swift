//
//  ExtraInfoCell1.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 23/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Foundation
import UIKit

class ExtraInfoCell1: UITableViewCell {
    
    @IBOutlet var extraInfoHumidity: UILabel!
    @IBOutlet var extraInfoHumidityNbr: UILabel!
    @IBOutlet var extraInfoWindSpeed: UILabel!
    @IBOutlet var extraInfoWindSpeedNbr: UILabel!
    
    func configure(cityData weatherData: WeatherData?) {
        
        extraInfoHumidityNbr.text = "\(Int((weatherData?.currently.humidity ?? 0) * 100))%"
        
        let windSpeed: Double = 3.6 * (weatherData?.currently.windSpeed.rounded() ?? 0)
        extraInfoWindSpeedNbr.text = "\(windSpeed)Km/h"
    }
}
