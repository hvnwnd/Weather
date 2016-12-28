//
//  WeatherDetailViewModel.swift
//  Weather
//
//  Created by Bin CHEN on 12/21/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation

protocol WeatherDetailViewModelDelegate {
    
}

class WeatherDetailViewModel {
    var temp : String?
    var tempMax : String?
    var tempMin : String?
    
    var icon : String?
    
    var pressure : Double?
    var seaPressure : Double?
    var grdPressure : Double?
    
    var humidity : String?
    
    var weatherLabel : String?
    var description : String?
    
    var cloud : String?
    var windSpeed : Double?
    var windDegree : Double?
    var rain : String?
    var snow : String?
    
    var visibility : String?
    var udpatedDate : Date?
    var city : String?
    
    init?(_ weather : WeatherInfo) {
        if let temp = weather.temp {
            self.temp = "\(temp)º"
        }
        
        if let minTemp = weather.tempMin {
            self.tempMin = "\(minTemp)º"
        }
        
        if let maxTemp = weather.tempMax {
            self.tempMax = "\(maxTemp)º"
        }
        
        if let label = weather.weatherLabel {
            self.weatherLabel = label
        }
        
        if let city = weather.city {
            self.city = city
        }
    }
    
    class func fetchWeather( _ city: String, completion : @escaping (_ weatherViewModel : WeatherDetailViewModel) -> () ) {
        RequestManager().fetchCurrentWeather(city) { info in
            if let viewModel = WeatherDetailViewModel(info) {
                completion(viewModel)
            }
        }
    }
}
