//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by adam smith on 10/18/22.
//

import Foundation
import UIKit

protocol CharacterDetailViewModelDelegate: CharacterDetailViewController {
    func characterHasData()
}

class CharacterDetailViewModel {
    
    var character: Character?
    weak var delegate: CharacterDetailViewModelDelegate?
    
    init(delegate: CharacterDetailViewModelDelegate?) {
        self.delegate = delegate
    }
}
