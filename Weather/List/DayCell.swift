//
//  DayCell.swift
//  Weather
//
//  Created by Bin CHEN on 12/27/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import UIKit

class DayCell : UITableViewCell {
    @IBOutlet weak var dayLabel : UILabel!
    @IBOutlet weak var tempMaxLabel : UILabel!
    @IBOutlet weak var tempMinLabel : UILabel!
    @IBOutlet weak var weatherLabel : UILabel!
    @IBOutlet weak var tempImageView : UIImageView!

    func setViewModel ( _ cellViewModel : WeatherCellViewModel) {
        dayLabel.text = cellViewModel.day
        tempMaxLabel.text = cellViewModel.tempMax
        tempMinLabel.text = cellViewModel.tempMin
        weatherLabel.text = cellViewModel.weatherLabel
        
        // TODO: manage image
//        tempImageView.image.loadimage = cellViewModel.icon
    }
}
