//
//  Movie.swift
//  Assessment3
//
//  Created by Timothy Rosenvall on 6/28/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation

struct TopLevelJSON: Decodable {
    let budget: Int
    let genres: [GenreDictionary]
    let homepage: URL
    let overview: String
    let poster_path: String
    let release_date: String
    let revenue: Int
    let spoken_languages: [SpokeLanguagesDictionary]
    let title: String
    let vote: Double
}

struct GenreDictionary: Decodable {
    let name: String
}

struct SpokeLanguagesDictionary: Decodable{
    let name: String
}

