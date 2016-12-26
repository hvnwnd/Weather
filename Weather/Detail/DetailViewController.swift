//
//  DetailViewController.swift
//  Weather
//
//  Created by Bin CHEN on 12/21/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

class DetailViewController: UIViewController {
    @IBOutlet weak var tempLabel : UILabel!
    @IBOutlet weak var cityLabel : UILabel!
    
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var viewModel = WeatherDetailViewModel()

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
        self.configureView()

        let signal : SignalProducer<String, NoError> = 
        Property(viewModel.temp).producter
//        tempLabel.reactive.text  <~ viewModel.temp
        
//        viewModel.temp.map { "\($0)" }.bind(to:tempLabel)
        
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

