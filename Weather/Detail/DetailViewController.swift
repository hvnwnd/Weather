//
//  DetailViewController.swift
//  Weather
//
//  Created by Bin CHEN on 12/21/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import UIKit
import AlamofireImage
import Bond

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
            viewModel?.temp.bind(to: tempLabel.bnd_text)
            viewModel?.tempMin.bind(to: tempMinLabel.bnd_text)
            viewModel?.tempMax.bind(to: tempMaxLabel.bnd_text)
            viewModel?.weatherLabel.bind(to: weatherLabel.bnd_text)
            viewModel?.city.bind(to: cityLabel.bnd_text)
            viewModel?.windSpeed.bind(to: windSpeedLabel.bnd_text)
            viewModel?.windDegree.bind(to: windDirectionLabel.bnd_text)
            viewModel?.humidity.bind(to: humidiyLabel.bnd_text)
            
            viewModel?.icon.observeNext(with: { (icon) in
                let url = URL(string: RequestUrl.imageBaseUrl + icon! + ".png")
                self.weatherImageView.af_setImage(withURL: url!)
            }).dispose()
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

