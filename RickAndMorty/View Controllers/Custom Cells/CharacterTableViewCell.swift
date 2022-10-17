//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by adam smith on 10/17/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterGender: UILabel!
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var characterSpecies: UILabel!
    @IBOutlet weak var characterorigin: UILabel!
    @IBOutlet weak var characterLocation: UILabel!
    

    func updateViews(with character: Character) {
        characterName.text = "Name: \(character.name)"
        characterGender.text = "Gender: \(character.gender)"
        characterStatus.text = "Status: \(character.status)"
        characterSpecies.text = "Specie: \(character.species)"
        characterorigin.text = "Origin: \(character.origin.name)"
        characterLocation.text = "Location: \(character.location.name)"
        fetchImage(for: character)
        makeRounded()
    }
    
    func makeRounded() {
        characterImageView.layer.cornerRadius = characterImageView.frame.size.width / 2
        characterImageView.clipsToBounds = true
    }
    
    func fetchImage(for character: Character) {
        APIService.fetchImage(with: character.image) { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.characterImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
