//
//  WeatherManager.swift
//  Clime
//
//  Created by user on 6/1/20.
//  Copyright © 2020 Tino. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ab5b800ce5dd0bf044b067667ba6ca68"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print(error!)
                        return
                    }
                    
                    if let safeData = data{
                        self.parseJSON(weatherData: safeData)
                    }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
        }catch{
            print(error)
        }
       
    }
}
