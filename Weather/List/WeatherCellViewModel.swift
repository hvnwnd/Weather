//
//  WeatherCellViewModel.swift
//  Weather
//
//  Created by Bin CHEN on 12/27/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation
import Bond

class WeatherCellViewModel {
    var tempMax = Observable<String?>("")
    var tempMin = Observable<String?>("")
    var day = Observable<String?>("")
    
    var icon = Observable<String?>("")
    var weatherLabel = Observable<String?>("")
    var bgImageName = Observable<String?>("")

    init(_ dayInfo : DayInfo){
        if let tmp = dayInfo.tempMax {
            tempMax.value = "▲\(tmp)°"
        }
        
        if let tmp = dayInfo.tempMin {
            tempMin.value = "▼\(tmp)°"
        }
        
        self.weatherLabel.value = dayInfo.weatherLabel
        
        if let date = dayInfo.date {
            self.day.value = date.dayOfWeek()
        }
        
        self.icon.value = dayInfo.icon
        self.bgImageName.value = dayInfo.weatherLabel?.lowercased()
    }
}
