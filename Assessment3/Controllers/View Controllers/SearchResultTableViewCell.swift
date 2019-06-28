//
//  SearchResultTableViewCell.swift
//  Assessment3
//
//  Created by Timothy Rosenvall on 6/28/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieRatingLabel: UILabel!
    
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    @IBAction func favoritesButtonTapped(_ sender: Any) {
    }
    
}
