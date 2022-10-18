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
    
    func defaultFetch() {
//        APIService.fetchCharacter(with: "") { [weak self] result in
//            switch result {
//            case .success(let character):
//                self?.character = character.results
//                self?.delegate?.searchTermHasData()
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    func fetchCharacter(with searchTerm: String) {
        service.fetchcharacterList(for: .name(searchTerm)) { result in
            switch result {
            case .success(let tld):
                self.character = tld.results
                DispatchQueue.main.async {
                    self.delegate?.searchTermHasData()
                }
            case .failure(let error):
                print(error)
            }
        }
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
