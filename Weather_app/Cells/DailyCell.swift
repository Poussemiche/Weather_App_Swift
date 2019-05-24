//
//  DailyCell.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 23/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Foundation
import UIKit

class DailyCell: UITableViewCell {
    
    @IBOutlet var dailyDay: UILabel!
    @IBOutlet var dailyImg: UIImageView!
    @IBOutlet var dailyTempMin: UILabel!
    @IBOutlet var dailyTempMax: UILabel!
    
    func configure(cityData weatherData: WeatherData?, row: Int) {
        
        //Convert timeInterval to format Day
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSince1970: weatherData?.daily.data[row].time ?? 0)
        dateFormatter.dateFormat = "EEEE"
        let finallyFormatted = dateFormatter.string(from: date)
        
        dailyDay.text = "\(finallyFormatted)"
        
        let iconURL: String = "./Icons/\(weatherData?.daily.data[row].icon ?? "").png"
        dailyImg.image = UIImage(named: iconURL)
        
        dailyTempMin.text = "\(weatherData?.daily.data[row].temperatureMin.rounded() ?? 0) °"
        
        dailyTempMax.text = "\(weatherData?.daily.data[row].temperatureMax.rounded() ?? 0) °"
    }
}
