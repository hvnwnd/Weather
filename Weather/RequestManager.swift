//
//  RequestManager.swift
//  Weather
//
//  Created by Bin CHEN on 12/23/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RequestManager {
    
    let informationPerDay : Int = 8
    let URL = "http://api.openweathermap.org/data/2.5/"
    let apikey = "d94ee8adc1c915e4a7bf965be033e6cb"
    
    func fetch5daysWeather(_ cityname: String, completion : @escaping (_ list:[WeatherInfo])->() ) {
        request("forecast", cityname:cityname) { json in
            let list = json["list"]
//            let infoList =
//                list.filter{ Int($0.0)! % self.informationPerDay == 1 }
//                    .map{ WeatherInfo($0.1)! }
            
            completion(list.map{ WeatherInfo($0.1)! })
        }
    }

    func fetchCurrentWeather(_ cityname: String, completion : @escaping (_ info: WeatherInfo)->() ) {
        request("weather", cityname:cityname) { json in
            if let info = WeatherInfo(json) {
                completion(info)
            }
        }
    }
    
    func request(_ service : String, cityname : String, completion: @escaping (_ json : JSON)->() ) {
        let params = ["units" : "metric",
            "appid" : apikey,
            "q" : cityname]
        
        Alamofire.request(URL+service, method: .get, parameters: params).responseData { response in
            if let data = response.result.value{
                let json = JSON(data: data)
                completion(json)
            }else {
                // errors
            }
        }
    }

}
