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
    private let service = CharacterSearchService()
    
    //MARK: - Dependancy Injection
    init(delegate: CharacterViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func fetchCharacter(with searchTerm: String) {
        //MARK: - refactored code
        service.fetchcharacterList(for: .name(searchTerm)) { [weak self] result in
            switch result {
            case .success(let tld):
                self?.character = tld.results
                DispatchQueue.main.async {
                    self?.delegate?.searchTermHasData()
                }
            case .failure(let error):
                print(error)
            }
        }
        //MARK: - Old code
//        APIService.fetchCharacter(with: searchTerm) { [weak self] result in
//            switch result {
//            case .success(let character):
//                self?.character = character.results
//                self?.delegate?.searchTermHasData()
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
