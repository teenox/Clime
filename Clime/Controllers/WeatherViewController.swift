//
//  ViewController.swift
//  Clime
//
//  Created by user on 5/23/20.
//  Copyright © 2020 Tino. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var weatherManager = WeatherManager()
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        

    }


    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let city = searchTextField.text{
            //print(city)
            weatherManager.fetchWeather(cityName: city)
        }
        
        
        searchTextField.endEditing(true)
    }
    @IBAction func LocationButtonPressed(_ sender: UIButton) {
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.CityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
