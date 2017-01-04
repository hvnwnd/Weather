//
//  MasterViewController.swift
//  Weather
//
//  Created by Bin CHEN on 12/21/16.
//  Copyright © 2016 Fantestech. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var viewModel : WeatherListViewModel?
    
    var detailViewController: DetailViewController? = nil
    var listCellViewModel : [WeatherCellViewModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Detail", style:.plain, target: self, action: #selector(showDetail(_:)))
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        let city = "Paris"
        
        self.title = city
        
        WeatherListViewModel.fetch5DaysWeather("\(city), fr") { listCellViewModel in
            self.listCellViewModel = listCellViewModel
            self.tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showDetail (_ sender : Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let detailViewController = storyboard.instantiateViewController(withIdentifier: "detailNav")
        present(detailViewController, animated: true, completion: {
            
        })
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = listCellViewModel?.count {
            return count
        }else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DayCell

        if let cellViewModel = listCellViewModel?[indexPath.row] {
            cell.viewModel = cellViewModel
        }
        
        return cell
    }

}

