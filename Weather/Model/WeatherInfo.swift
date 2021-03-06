//
//  WeatherInfo.swift
//  Weather
//
//  Created by Bin CHEN on 12/21/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WeatherInfo {
    var identifier : String?
    
    var temp : Int?
    var tempMax : Int?
    var tempMin : Int?
    
    var icon : String?

    var pressure : Double?
    var seaPressure : Double?
    var grdPressure : Double?
    
    var humidity : Int?
    
    var weatherLabel : String?
    var description : String?
    
    var cloud : String?
    var windSpeed : Double?
    var windDegree : Double?
    var rain : String?
    var snow : String?
    
    var city : String?
    var visibility : Int?
    var updatedDate : Date?
}

extension WeatherInfo {
    
    init?(_ json : JSON) {
        
        self.identifier = json["id"].stringValue
        
        guard identifier != nil else {
            return nil
        }
        
        let weather = json["weather"][0]
        self.weatherLabel = weather["main"].stringValue
        self.description = weather["description"].stringValue
        self.icon = weather["icon"].stringValue
        
        let main = json["main"]
        
        self.temp = main["temp"].intValue
        self.tempMax = main["temp_max"].intValue
        self.tempMin = main["temp_min"].intValue
        self.humidity = main["humidity"].intValue
        self.pressure = main["pressure"].doubleValue

        self.visibility = json["visibility"].intValue
        self.city = json["name"].stringValue
        
        let wind = json["wind"]
        if wind != JSON.null {
            self.windSpeed = wind["speed"].doubleValue
            self.windDegree = wind["deg"].doubleValue
        }
        
        self.cloud = json["cloud"]["all"].stringValue
        self.rain = json["rain"].stringValue
        self.snow = json["snow"].stringValue
        
        self.updatedDate = Date.init(timeIntervalSince1970: TimeInterval(json["dt"].intValue))
    }
    
    func isSameDay( anotherInfo : WeatherInfo) -> Bool {
        return self.updatedDate!.startOfDay() == anotherInfo.updatedDate?.startOfDay()
    }
}
