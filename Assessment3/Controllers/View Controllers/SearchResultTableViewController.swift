//
//  SearchResultTableViewController.swift
//  Assessment3
//
//  Created by Timothy Rosenvall on 6/28/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class SearchResultTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MovieController.sharedInstance.results.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultsCell", for: indexPath) as? SearchResultTableViewCell else {return UITableViewCell()}
        let result = MovieController.sharedInstance.results[indexPath.row + 1]
        cell.movieTitleLabel.text = result.title
        cell.movieRatingLabel.text = "\(result.vote_average)"
        cell.movieOverviewLabel.text = result.overview
        return cell
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}

extension SearchResultTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, searchTerm != "" else {return}
        
        MovieController.sharedInstance.fetchSearchResults(searchText: searchTerm, completion: { (results) in
            if let unwrappedSearchResults = results {
                MovieController.sharedInstance.results = unwrappedSearchResults
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
}
