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
    
    var label : String?
    var description : String?
    
    var cloud : String?
    var windSpeed : Double?
    var windDegree : Double?
    var rain : String?
    var snow : String?
    
    var visibility : String?
    var udpatedDate : Date?
        
    init() {
        RequestManager().fetchCurrentWeather("paris,fr") { info in
            print(info.temp)
        }
    }
}
