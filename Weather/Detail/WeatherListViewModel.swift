//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Bin CHEN on 12/21/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation
class WeatherListViewModel {
    
    class func fetch5DaysWeather(_ city: String, completion: @escaping ( [WeatherCellViewModel] ) -> Void ) {
        RequestManager().fetch5daysWeather(city) { listWeatherInfo in
            let result = self.convert(listWeatherInfo)
            completion(result)
        }
    }
    
    class func convert(_ listWeatherInfo : [WeatherInfo]) -> [WeatherCellViewModel] {
        var dayWeatherDict = [Date : [WeatherInfo]]()
        let today = Date().startOfDay()
        for weatherInfo in listWeatherInfo {
            
            let date = weatherInfo.updatedDate?.startOfDay()
            
            if today == date {
                continue
            }
            var weatherInfoOfDay = dayWeatherDict[date!] ?? []
            weatherInfoOfDay.append(weatherInfo)
            dayWeatherDict[date!] = weatherInfoOfDay
        }
        
        return dayWeatherDict.map({ (key: Date, value: [WeatherInfo]) -> DayInfo in
            return DayInfo(value)
        }).sorted(by: { $0.date! < $1.date! })
            .map{ WeatherCellViewModel($0) }
    }
}
