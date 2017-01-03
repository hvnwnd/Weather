//
//  WeatherCellViewModel.swift
//  Weather
//
//  Created by Bin CHEN on 12/27/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation

class WeatherCellViewModel {
    var tempMax : String?
    var tempMin : String?
    var day : String?
    
    var icon : String?
    var weatherLabel : String?
    var bgImageName : String?

    init(_ dayInfo : DayInfo){
        if let tmp = dayInfo.tempMax {
            tempMax = "\(tmp)°"
        }
        
        if let tmp = dayInfo.tempMin {
            tempMin = "\(tmp)°"
        }
        
        self.weatherLabel = dayInfo.weatherLabel
        
        if let date = dayInfo.date {
            self.day = date.dayOfWeek()
        }
        
        self.icon = dayInfo.icon
        self.bgImageName = weatherLabel?.lowercased()
    }
}
