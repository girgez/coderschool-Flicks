//
//  MovieCollectionCell.swift
//  Movies
//
//  Created by GIRGEZ on 10/15/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    @IBOutlet weak var posterView: UIImageView!
    
    func setMovie(posterStringUrl: String?) {
        if let url = Net.urlMediumPoster(posterPath: posterStringUrl) {
            posterView.setImageWith(url)
        }
    }
}
