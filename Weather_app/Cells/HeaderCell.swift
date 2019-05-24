//
//  HeaderCell.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 23/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class HeaderCell: UITableViewCell {
    
    @IBOutlet var weatherImg: UIImageView!
    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var currentSummary: UILabel!
    @IBOutlet var hourlySummary: UILabel!
    
    func configure(cityData weatherData: WeatherData.Currently?, cityData2: WeatherData.Hourly?) {
        
        let iconURL: String = "./Icons/\(weatherData?.icon ?? "").png"
        weatherImg.image = UIImage(named: iconURL)
        
        currentTemp.text = "\(weatherData?.temperature.rounded() ?? 0) °"

        currentSummary.text = weatherData?.summary

        hourlySummary.text = cityData2?.summary
    }
}
