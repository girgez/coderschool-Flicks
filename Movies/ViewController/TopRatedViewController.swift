//
//  TopRatedViewController.swift
//  Movies
//
//  Created by GIRGEZ on 10/12/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import UIKit

class TopRatedViewController: MoviesViewController {
    @IBOutlet weak var outletTableView: UITableView!
    @IBOutlet weak var outletCollectionView: UICollectionView!
 
    override func viewDidLoad() {
        self.tableView = outletTableView
        self.collectionView = outletCollectionView
        self.type = MoviesViewControllerType.topRated
        super.viewDidLoad()
    }
}
