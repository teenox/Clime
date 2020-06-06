//
//  WeatherManager.swift
//  Clime
//
//  Created by user on 6/1/20.
//  Copyright © 2020 Tino. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    var delegate: WeatherManagerDelegate?
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
                        if let weather = self.parseJSON(safeData){
                            self.delegate?.didUpdateWeather(self, weather: weather)
                        }
                    }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, CityName: name, temperature: temp)
            return weather
            
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
       
    }
}
