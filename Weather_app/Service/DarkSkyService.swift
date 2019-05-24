//
//  DarkSkyService.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 22/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Alamofire
import Foundation
import CoreLocation
    
    class APIManager {
        
        private static let apiKey = "a1b5f7087df131e3655d628b37feb918"
        
        static func GetWeather(coordinates: CLLocationCoordinate2D?, success: @escaping (Data)-> (), failure: @escaping (Error)-> ()) {
            if let coordinate = coordinates {
            Alamofire.request("https://api.darksky.net/forecast/\(apiKey)/\(coordinate.latitude),\(coordinate.longitude)?units=si").responseData { (response) in
                    switch response.result {
                    case .success(let value):
                        success(value)
                        break
                    case .failure(let error):
                        failure(error)
                        break
                    }
                }
            }
        }
    }
    
    
    
//    static func weatherForCoordinates(latitude: String, longitude: String, completion: @escaping (WeatherData?, Error?) -> ()) {
//
//        let url = baseUrl + "\(apiKey)/\(latitude),\(longitude)"
//
//        Alamofire.request(url).responseJSON { response in
//            switch response.result {
//            case .success:
//                let weather = JSONParser.parseWeatherData(data: response.result.value!)
//                completion(weather, nil)
//            case .failure(let error):
//                completion(nil, error)
//            }
//        }
//    }
//
//    // In this struct you could have more funcs. For example,
//    // weatherForZipCode(...), weatherForCity(...) depending on the parameter(s) you pass
//}
