//
//  Date+Extension.swift
//  Weather
//
//  Created by Bin CHEN on 12/27/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import Foundation

extension Date {
    func startOfDay () -> Date {
        let cal = Calendar(identifier: .gregorian)
        return cal.startOfDay(for: self)
    }
    
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}

