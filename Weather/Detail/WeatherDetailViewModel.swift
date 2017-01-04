//
//  WeatherDetailViewModel.swift
//  Weather
//
//  Created by Bin CHEN on 12/21/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation
import Bond

class WeatherDetailViewModel {
    
    var temp = Observable<String?>("")
    var tempMax = Observable<String?>("")
    var tempMin = Observable<String?>("")
    
    var icon = Observable<String?>("")
    
    var pressure = Observable<String?>("")
    
    var humidity = Observable<String?>("")
    
    var weatherLabel = Observable<String?>("")
    var description = Observable<String?>("")
    
    var cloud = Observable<String?>("")
    var windSpeed = Observable<String?>("")
    var windDegree = Observable<String?>("")
    var rain = Observable<String?>("")
    var snow = Observable<String?>("")
    
    var visibility = Observable<String?>("")
    var city = Observable<String?>("")
    
    init?(_ weather : WeatherInfo) {
        if let temp = weather.temp {
            self.temp.value = "\(temp)º"
        }
        
        if let minTemp = weather.tempMin {
            self.tempMin.value = "▼\(minTemp)º"
        }
        
        if let maxTemp = weather.tempMax {
            self.tempMax.value = "▲\(maxTemp)º"
        }
        
        if let label = weather.weatherLabel {
            self.weatherLabel.value = label
        }
        
        if let city = weather.city {
            self.city.value = city
        }
        
        if let humidity = weather.humidity {
            self.humidity.value = "\(humidity)%"
        }
        
        if let windSpeed = weather.windSpeed {
            self.windSpeed.value = "\(windSpeed) m/s"
        }
        
        if let windDegree = weather.windDegree {
            self.windDegree.value = windDirection(windDegree)
        }
        
        if let rain = weather.rain {
            self.rain.value = rain
        }
        
        if let snow = weather.snow {
            self.snow.value = snow
        }
        
        if let cloud = weather.cloud {
            self.cloud.value = cloud
        }
        
        if let distanceOfVisibility = weather.visibility {
            let distanceOfVisibilityInKm = distanceOfVisibility / 1000
            self.visibility.value = "\(distanceOfVisibilityInKm)km"
        }
        
        self.icon.value = weather.icon
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
