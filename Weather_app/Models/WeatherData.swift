//
//  WeatherData.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 22/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Foundation

// ******************
// GLOBAL DATA STRUCT
struct WeatherData: Decodable {

     // ******************
    // DAILY DATA STRUCT
    struct DailyData: Decodable {
        var time: Double
        var icon: String
        var temperatureMin: Double
        var temperatureMax: Double
    }

    struct Daily: Decodable {
        var summary: String
        var data: [DailyData]
    }

     // ******************
    // HOURLY DATA STRUCT
    struct HourlyData: Decodable {
        var time: Double
        var icon: String
        var humidity: Double
        var temperature: Double
    }

    struct Hourly: Decodable {
        var summary: String
        var data: [HourlyData]
    }
    
    // ******************
    // CURRENT WEATHER DATA STRUCT
    struct Currently: Decodable {
        var icon: String
        var temperature: Double
        var summary: String
        var windSpeed: Double
        var humidity: Double
        var pressure: Double
        var uvIndex: Int
    }
    
    var daily: Daily
    var hourly: Hourly
    var currently: Currently
}
