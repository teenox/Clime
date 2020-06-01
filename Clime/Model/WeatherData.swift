//
//  WeatherData.swift
//  Clime
//
//  Created by user on 6/1/20.
//  Copyright © 2020 Tino. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
}

struct Main: Decodable{
    let temp: Double
}
