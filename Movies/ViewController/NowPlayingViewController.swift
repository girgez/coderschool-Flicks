//
//  NowPlayingViewController.swift
//  Movies
//
//  Created by Girge on 10/16/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import UIKit

class NowPlayingViewController: MoviesViewController {
    @IBOutlet weak var outletTableView: UITableView!
    @IBOutlet weak var outletCollectionView: UICollectionView!

    override func viewDidLoad() {
        self.tableView = outletTableView
        self.collectionView = outletCollectionView
        self.type = MoviesViewControllerType.nowPlaying
        super.viewDidLoad()
    }
}
