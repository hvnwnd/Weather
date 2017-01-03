//
//  DetailViewController.swift
//  Weather
//
//  Created by Bin CHEN on 12/21/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {
    @IBOutlet weak var tempLabel : UILabel!
    @IBOutlet weak var tempMinLabel : UILabel!
    @IBOutlet weak var tempMaxLabel : UILabel!
    
    @IBOutlet weak var cityLabel : UILabel!
    @IBOutlet weak var weatherLabel : UILabel!
    
    @IBOutlet weak var weatherImageView : UIImageView!
    @IBOutlet weak var windSpeedLabel : UILabel!
    @IBOutlet weak var windDirectionLabel : UILabel!
    @IBOutlet weak var humidiyLabel : UILabel!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var viewModel : WeatherDetailViewModel? {
        didSet {
            tempLabel.text = viewModel?.temp
            tempMinLabel.text = viewModel?.tempMin
            tempMaxLabel.text = viewModel?.tempMax
            weatherLabel.text = viewModel?.weatherLabel
            cityLabel.text = viewModel?.city
            windSpeedLabel.text = viewModel?.windSpeed
            windDirectionLabel.text = viewModel?.windDegree
            humidiyLabel.text = viewModel?.humidity
            
            let url = URL(string: RequestUrl.imageBaseUrl + (viewModel?.icon)! + ".png")
            weatherImageView.af_setImage(withURL: url!)
        }

    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        WeatherDetailViewModel.fetchWeather("paris, fr") { viewModel in
            self.viewModel = viewModel
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

