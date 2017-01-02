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
    static let ImageBaseUrl = "http://openweathermap.org/img/w/"
    
    let informationPerDay : Int = 8
    let URL = "http://api.openweathermap.org/data/2.5/"
    let apikey = "d94ee8adc1c915e4a7bf965be033e6cb"
    
    func fetch5daysWeather(_ cityname: String, completion : @escaping (_ list:[WeatherInfo])->Void ) {
        request("forecast", cityname:cityname) { json in
            let list = json["list"]
            completion(list.map{ WeatherInfo($0.1)! })
        }
    }

    func fetchCurrentWeather(_ cityname: String, completion : @escaping (_ info: WeatherInfo)->Void ) {
        request("weather", cityname:cityname) { json in
            if let info = WeatherInfo(json) {
                completion(info)
            }
        }
    }
    
    private func request(_ service : String, cityname : String, completion: @escaping (_ json : JSON)->Void ) {
        let params = ["units" : "metric",
            "appid" : apikey,
            "q" : cityname]
        
        let request = Alamofire.request(URL+service, method: .get, parameters: params).responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data: data)
                completion(json)
            case .failure(let error):
                self.handle(error: error)
            }
        }
        debugPrint(request)
    }

    private func handle( error : Error) {
        print(error.localizedDescription)
    }
    
}
