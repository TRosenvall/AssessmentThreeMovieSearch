//
//  SearchResults.swift
//  Assessment3
//
//  Created by Timothy Rosenvall on 6/28/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation

struct SearchResultsTopLevelJSON: Decodable {
    let id: Int
    let vote_average: Int
    let title: String
    let poster_path: String?
    let overview: String
}
