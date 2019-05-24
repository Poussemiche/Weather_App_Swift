//
//  HourlyCell.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 23/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Foundation
import UIKit

class HourlyCell: UITableViewCell {
    
    @IBOutlet var hourlyTime: UILabel!
    @IBOutlet var hourlyImg: UIImageView!
    @IBOutlet var hourlyHumidity: UILabel!
    @IBOutlet var hourlyTemp: UILabel!
 
    func configure(cityData weatherData: WeatherData?, row: Int) {
        
        //Convert timeInterval to format HH
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSince1970: weatherData?.hourly.data[row].time ?? 0)
        dateFormatter.dateFormat = "HH"
        let finallyFormatted = dateFormatter.string(from: date)
        
        hourlyTime.text = "\(finallyFormatted)H"
        
        let iconURL: String = "./Icons/\(weatherData?.hourly.data[row].icon ?? "").png"
        hourlyImg.image = UIImage(named: iconURL)
        
        hourlyHumidity.text = "\(Int((weatherData?.hourly.data[row].humidity ?? 0) * 100))%"
        
        hourlyTemp.text = "\(weatherData?.hourly.data[row].temperature.rounded() ?? 0) °"
    }
}
