//
//  WeatherData.swift
//  Clime
//
//  Created by user on 6/1/20.
//  Copyright © 2020 Tino. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let id: Int
    let description: String
}
