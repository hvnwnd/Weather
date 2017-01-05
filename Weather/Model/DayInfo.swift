//
//  DayInfo.swift
//  Weather
//
//  Created by Bin CHEN on 12/27/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation

struct DayInfo {
    
    var date : Date?
    var tempMax : Int?
    var tempMin : Int?
    
    var icon : String?
    var weatherLabel : String?

}

extension DayInfo {

    init(_ list : [WeatherInfo]) {
        
        self.date = list.first?.updatedDate
        self.tempMax = list.reduce(Int.min){ max($0, $1.tempMax!) }
        self.tempMin = list.reduce(Int.max){ min($0, $1.tempMin!) }
        
        self.icon = (list.map{ $0.icon} as! [String] ).mode
        self.weatherLabel = (list.map{ $0.weatherLabel! }).mode
    }
}

