//
//  ViewController.swift
//  Clime
//
//  Created by user on 5/23/20.
//  Copyright © 2020 Tino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let weatherManager = WeatherManager()
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        weatherManager.fetchWeather(cityName: "Pretoria")
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

