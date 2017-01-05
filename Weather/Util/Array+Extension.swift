//
//  Array+Extension.swift
//  Weather
//
//  Created by Bin CHEN on 1/5/17.
//  Copyright © 2017 Fantestech. All rights reserved.
//

import Foundation


extension Array where Element: Hashable {
    var mode: Element? {
        return self.reduce([Element: Int]()) {
            var counts = $0
            counts[$1] = ($0[$1] ?? 0) + 1
            return counts
            }.max { $0.1 < $1.1 }?.0
    }
}
