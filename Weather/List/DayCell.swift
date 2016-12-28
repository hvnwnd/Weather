//
//  DayCell.swift
//  Weather
//
//  Created by Bin CHEN on 12/27/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import UIKit
import AlamofireImage
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
        
        let url = URL(string: RequestManager.ImageBaseUrl + cellViewModel.icon! + ".png")
        tempImageView.af_setImage(withURL: url!)
    }
}
