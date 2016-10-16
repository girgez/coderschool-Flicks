//
//  SettingViewController.swift
//  Movies
//
//  Created by GIRGEZ on 10/15/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.selectedSegmentIndex = Share.viewStyle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func changeViewStyle(_ sender: AnyObject) {
        Share.viewStyle = segmentedControl.selectedSegmentIndex
    }
}
