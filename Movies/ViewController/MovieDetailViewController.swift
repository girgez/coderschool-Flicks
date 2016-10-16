//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by GIRGEZ on 10/12/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: NSDictionary?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Net.urlLargePoster(posterPath: movie?["poster_path"] as? String) {
            posterView.setImageWith(url)
        }
        
        titleLabel.text = movie?["title"] as? String
        overviewLabel.text = movie?["overview"] as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
