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
    
    private let apiService = APIService()

    func updateViews(with character: Character) {
        characterName.text = character.name
        fetchImage(for: character)
        makeRounded()
    }
    
    func makeRounded() {
        characterImageView.layer.cornerRadius = characterImageView.frame.size.width / 2
        characterImageView.clipsToBounds = true
    }
    
    func fetchImage(for character: Character) {
        guard let imageURL = URL(string: character.image) else { return }
        let request = URLRequest(url: imageURL)
        apiService.perform(request) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.characterImageView.image = image
                }
            }
        }
//        APIService.fetchImage(with: character.image) { [weak self] result in
//            switch result {
//            case .success(let image):
//                DispatchQueue.main.async {
//                    self?.characterImageView.image = image
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
