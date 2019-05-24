//
//  ParseWeatherData.swift
//  Weather_app
//
//  Created by Gabriel ROGER DE CAMPAGNOLLE on 23/05/2019.
//  Copyright © 2019 Gabriel ROGER DE CAMPAGNOLLE. All rights reserved.
//

import Foundation

struct 


{
    "name": "Jon",
    "family_name": "Snow",
    "age": 30
}

struct User: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case familyName = "family_name"
        case age
    }
    
    var name: String
    var familyName: String
    var age: Int
}
