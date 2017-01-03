//
//  WeatherDetailViewModel.swift
//  Weather
//
//  Created by Bin CHEN on 12/21/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation


class WeatherDetailViewModel {
    
    var temp : String?
    var tempMax : String?
    var tempMin : String?
    
    var icon : String?
    
    var pressure : Double?
    
    var humidity : String?
    
    var weatherLabel : String?
    var description : String?
    
    var cloud : String?
    var windSpeed : String?
    var windDegree : String?
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
        
        if let humidity = weather.humidity {
            self.humidity = "\(humidity)%"
        }
        
        if let windSpeed = weather.windSpeed {
            self.windSpeed = "\(windSpeed) m/s"
        }
        
        if let windDegree = weather.windDegree {
            self.windDegree = windDirection(windDegree)
        }
        
        if let rain = weather.rain {
            self.rain = rain
        }
        
        if let snow = weather.snow {
            self.snow = snow
        }
        
        if let cloud = weather.cloud {
            self.cloud = cloud
        }
        
        if let distanceOfVisibility = weather.visibility {
            let distanceOfVisibilityInKm = distanceOfVisibility / 1000
            self.visibility = "\(distanceOfVisibilityInKm)km"
        }
        
        self.icon = weather.icon
    }
    
    class func fetchWeather( _ city: String, completion : @escaping (_ weatherViewModel : WeatherDetailViewModel) -> () ) {
        RequestManager().fetchCurrentWeather(city) { info in
            if let viewModel = WeatherDetailViewModel(info) {
                completion(viewModel)
            }
        }
    }
    
    func windDirection(_ degree : Double) -> String {
        let northeast = 56.25
        let southeast = 123.75
        let southwest = 236.75
        let northwest = 303.75
        
        var direction : String
        if degree > northeast && degree <= southeast {
            direction = "East"
        }else if degree > southeast && degree <= southwest {
            direction = "South"
        }else if degree > southwest && degree <= northwest {
            direction = "West"
        }else {
            direction = "North"
        }
        return direction
    }
}
