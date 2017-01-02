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

    var viewModel : WeatherCellViewModel? {
        didSet {
            dayLabel.text = viewModel?.day
            tempMaxLabel.text = viewModel?.tempMax
            tempMinLabel.text = viewModel?.tempMin
            weatherLabel.text = viewModel?.weatherLabel
            
            if let icon = viewModel?.icon {
                let url = URL(string: RequestManager.ImageBaseUrl + icon + ".png")
                tempImageView.af_setImage(withURL: url!)
            }
        }
    }
}
