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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
