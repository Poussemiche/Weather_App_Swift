//
//  DetailsViewController.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 22/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var dataReceived: MKPointAnnotation?
    var weatherData: WeatherData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = dataReceived?.title ?? ""
        
        tableView.delegate = self
        self.tableView.delegate  =  self
        self.tableView.dataSource = self
        
        requestWeather()
    }
    
    func requestWeather() {
        APIManager.GetWeather(coordinates: dataReceived?.coordinate, success: { (data) in
            let jsondecoder = JSONDecoder()
            
            self.weatherData = (try? jsondecoder.decode(WeatherData.self, from: data))
            self.tableView.reloadData()
            print("success decode")
            
        }, failure: { (error) in
            print(error)
        })
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return weatherData?.hourly.data.count ?? 0
        case 2:
            return 1
        case 3:
            return weatherData?.daily.data.count ?? 0
        case 4:
            return 1
        case 5:
            return 1
        case 6:
            return 1
        case 7:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as? HeaderCell {
                cell.configure(cityData: weatherData?.currently, cityData2: weatherData?.hourly)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyCell", for : indexPath) as? HourlyCell {
                cell.configure(cityData: weatherData, row: indexPath.item)
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DailySummaryCell", for : indexPath) as? DailySummaryCell {
                cell.configure(cityData: weatherData)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DailyCell", for : indexPath) as? DailyCell {
                cell.configure(cityData: weatherData, row: indexPath.item)
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraInfoTitleCell", for : indexPath) as? ExtraInfoTitleCell {
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraInfoCell1", for : indexPath) as? ExtraInfoCell1 {
                cell.configure(cityData: weatherData)
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraInfoCell2", for : indexPath) as? ExtraInfoCell2 {
                cell.configure(cityData: weatherData)
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}

