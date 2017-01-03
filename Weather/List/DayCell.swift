//
//  DayCell.swift
//  Weather
//
//  Created by Bin CHEN on 12/27/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import UIKit
import AlamofireImage
import Bond

class DayCell : UITableViewCell {
    @IBOutlet weak var bgImageView : UIImageView!
    @IBOutlet weak var dayLabel : UILabel!
    @IBOutlet weak var tempMaxLabel : UILabel!
    @IBOutlet weak var tempMinLabel : UILabel!
    @IBOutlet weak var weatherLabel : UILabel!
    @IBOutlet weak var tempImageView : UIImageView!

    var viewModel : WeatherCellViewModel? {
        didSet {
            viewModel?.day.bind(to: dayLabel.bnd_text)
            viewModel?.tempMax.bind(to: tempMaxLabel.bnd_text)
            viewModel?.tempMin.bind(to: tempMinLabel.bnd_text)
            viewModel?.weatherLabel.bind(to: weatherLabel.bnd_text)
            viewModel?.bgImageName.observeNext(with: { bgImageName in
                if let image = UIImage.init(named: bgImageName!) {
                    self.bgImageView.image = image
                }else {
                    self.bgImageView.image = UIImage.init(named: "clear")
                }

            }).dispose()

            viewModel?.icon.observeNext(with: { icon in
                let url = URL(string: RequestUrl.imageBaseUrl + icon! + ".png")
                self.tempImageView.af_setImage(withURL: url!)
            }).dispose()
        }
    }
}
