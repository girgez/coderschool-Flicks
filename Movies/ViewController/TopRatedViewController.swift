//
//  TopRatedViewController.swift
//  Movies
//
//  Created by GIRGEZ on 10/12/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import UIKit

class TopRatedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Net.loadMovies(type: 1, isProgressHUDLoading: true, success: {
            self.movies = $0
            self.tableView.reloadData()
            self.collectionView.reloadData()
        })
        
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction), for: UIControlEvents.valueChanged)
        collectionView.insertSubview(refreshControl, at: 0)
    }
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        Net.loadMovies(type: 1, isProgressHUDLoading: false, success: {
            self.movies = $0
            self.tableView.reloadData()
            self.collectionView.reloadData()
            refreshControl.endRefreshing()
            }, fail: {
                refreshControl.endRefreshing()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Share.viewStyle == 0 {
            tableView.isHidden = false
            collectionView.isHidden = true
        } else {
            tableView.isHidden = true
            collectionView.isHidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menu" {
            return
        }
        
        let movieDetailVC = segue.destination as! MovieDetailViewController
        
        if Share.viewStyle == 0 {
            movieDetailVC.movie = movies[(tableView.indexPathForSelectedRow?.row)!]
        } else {
            movieDetailVC.movie = movies[(collectionView.indexPathsForSelectedItems?[0].row)!]
        }
    }
}

extension TopRatedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        
        
        let movie = movies[indexPath.row] as NSDictionary
        cell.setMovie(posterStringUrl: movie["poster_path"] as? String, title: movie["title"] as? String, overview: movie["overview"] as? String)
        
        return cell
    }
}

extension TopRatedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionCell
        
        let movie = movies[indexPath.row] as NSDictionary
        cell.setMovie(posterStringUrl: movie["poster_path"] as? String)
        
        return cell
    }
}
