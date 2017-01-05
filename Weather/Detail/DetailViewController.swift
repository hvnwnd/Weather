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
    @IBOutlet weak var visibilityLabel : UILabel!
    
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
            viewModel?.visibility.bind(to: visibilityLabel.bnd_text)
            
            viewModel?.icon.observeNext(with: { (icon) in
                let url = URL(string: RequestUrl.imageBaseUrl + icon! + ".png")
                self.weatherImageView.af_setImage(withURL: url!)
            }).dispose()
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        WeatherDetailViewModel.fetchWeather("paris, fr") { viewModel in
            self.viewModel = viewModel
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "X", style: .done, target: self, action: #selector(dismiss(_:)))
        
    }

    func dismiss(_ sender : Any) {
        self.dismiss(animated: true) {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

