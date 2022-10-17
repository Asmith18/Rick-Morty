//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by adam smith on 10/17/22.
//

import Foundation

protocol CharacterViewModelDelegate: AnyObject {
    func searchTermHasData()
}

class CharacterViewModel {
    
    var character: [Character] = []
    weak var delegate: CharacterViewModelDelegate?
    
    //MARK: - Dependancy Injection
    init(delegate: CharacterViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func fetchCharacter(with searchTerm: String) {
        APIService.fetchCharacter(with: searchTerm) { [weak self] result in
            switch result {
            case .success(let character):
                self?.character = character.results
                self?.delegate?.searchTermHasData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
