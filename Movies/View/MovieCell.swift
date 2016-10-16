//
//  MovieCell.swift
//  Movies
//
//  Created by GIRGEZ on 10/11/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import UIKit
import AFNetworking

class MovieCell: UITableViewCell {
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setMovie(posterStringUrl: String?, title: String?, overview: String?) {
        if let url = Net.urlSmallPoster(posterPath: posterStringUrl) {
            posterView.setImageWith(url)
        }
        titleLabel.text = title
        overviewLabel.text = overview
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
