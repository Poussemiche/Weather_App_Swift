//
//  ExtraInfoCell2.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 23/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Foundation
import UIKit

class ExtraInfoCell2: UITableViewCell {
    
    @IBOutlet var extraInfoPressure: UILabel!
    @IBOutlet var extraInfoPressureNbr: UILabel!
    @IBOutlet var extraInfoUvIndex: UILabel!
    @IBOutlet var extraInfoUvIndexNbr: UILabel!
    
    func configure(cityData weatherData: WeatherData?) {
        
        extraInfoPressureNbr.text = "\(weatherData?.currently.pressure ?? 0) hPa"
        
        extraInfoUvIndexNbr.text = "\(weatherData?.currently.uvIndex ?? 0)"
    }
}
