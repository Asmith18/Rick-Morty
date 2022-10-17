//
//  CharacterTableViewController.swift
//  RickAndMorty
//
//  Created by adam smith on 10/17/22.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    //MARK: - Properties
    var viewModel: CharacterViewModel!
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        viewModel = CharacterViewModel(delegate: self)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.character.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath) as! CharacterTableViewCell
        let result = viewModel.character[indexPath.row]
        cell.updateViews(with: result)

        return cell
    }
}

extension CharacterTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text,
              !searchTerm.isEmpty else { return }
        
        viewModel.fetchCharacter(with: searchTerm)
    }
}

extension CharacterTableViewController: CharacterViewModelDelegate {
    func searchTermHasData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
