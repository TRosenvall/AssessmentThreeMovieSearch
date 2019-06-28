//
//  MovieController.swift
//  Assessment3
//
//  Created by Timothy Rosenvall on 6/28/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class MovieController {
    
    // Singleton
    static let sharedInstance = MovieController()
    
    // SourceOfTruth
    var results: [SearchResultsTopLevelJSON] = []
    
    func fetchSearchResults (searchText: String, completion: @escaping ([SearchResultsTopLevelJSON]?) -> Void) {
        guard let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=fa9ce6a782cd416cbafdd5025fe42d0e") else {completion(nil); return}
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let apiKey = URLQueryItem(name: "api_key", value: "fa9ce6a782cd416cbafdd5025fe42d0e")
        let searchTextQuery = URLQueryItem(name: "query", value: searchText)
        components?.queryItems = [apiKey, searchTextQuery]
        guard let finalURL = components?.url else {completion(nil);return}
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil);return
            } else if let data = data {
                let decoder = JSONDecoder()
                do{
                    let searchResult = try decoder.decode([SearchResultsTopLevelJSON].self, from: data)
                    self.results = searchResult
                    completion(searchResult); return
                } catch {
                    print(error.localizedDescription)
                    completion(nil);return
                }
            }
        }.resume()
    }
    
    func fetchPosterImage (movie: SearchResultsTopLevelJSON, completion: @escaping (UIImage?) -> Void ) {
        
    }
}


