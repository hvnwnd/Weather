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
            var tempDict = [Date : [WeatherInfo]]()
            let today = Date().startOfDay()
            for weatherInfo in listWeatherInfo {
                
                let date = weatherInfo.updatedDate?.startOfDay()
                
                if today == date {
                    continue
                }
                var arr = tempDict[date!]
                if arr != nil {
                    arr!.append(weatherInfo)
                    tempDict[date!] = arr
                }else{
                    tempDict[date!] = [weatherInfo]
                }
            }
            
            let result = tempDict.map({ (key: Date, value: [WeatherInfo]) -> DayInfo in
                return DayInfo(value)
            }).sorted(by: { $0.date! < $1.date! })
                .map{ WeatherCellViewModel($0) }
            
            completion(result)
        }
    }
}
