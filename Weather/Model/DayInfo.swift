//
//  DayInfo.swift
//  Weather
//
//  Created by Bin CHEN on 12/27/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation

extension Sequence where Self.Iterator.Element: Equatable {
    private typealias Element = Self.Iterator.Element
    
    func mostOccurance() -> Element {
        
        let empty: [(Element, Int)] = []
        
        var temp = reduce(empty) { (accu: [(Element, Int)], element) in
            var accu = accu
            for (index, value) in accu.enumerated() {
                if value.0 == element {
                    accu[index].1 += 1
                    return accu
                }
            }
            
            return accu + [(element, 1)]
        }
        // Fixme: sort by number 
        return temp[0].0
    }
}

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
        
        self.icon = (list.map{ $0.icon} as! [String] ).mostOccurance()
        self.weatherLabel = (list.map{ $0.weatherLabel } as! [String]).mostOccurance()
    
    }
}

