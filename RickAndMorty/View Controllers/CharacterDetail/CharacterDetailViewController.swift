//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by adam smith on 10/18/22.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    //MARK: - Properties
    var viewModel: CharacterDetailViewModel!
    private let apiService = APIService()
    //MARK: - Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterOriginLabel: UILabel!
    @IBOutlet weak var characterLocationLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var characterSpeciesLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard let gender = viewModel.character?.gender,
              let status = viewModel.character?.status,
              let species = viewModel.character?.species,
              let image = viewModel.character?.image
        else { return }
        characterNameLabel.text     = viewModel?.character?.name
        characterOriginLabel.text   = viewModel?.character?.origin.name
        characterLocationLabel.text = viewModel?.character?.location.name
        characterGenderLabel.text   = "Gender: \(gender)"
        characterStatusLabel.text   = "Status: \(status)"
        characterSpeciesLabel.text  = "Species: \(species)"
//        fetchImage(for: image)
        detailView.layer.cornerRadius = 20
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
    }
}



extension CharacterDetailViewController: CharacterDetailViewModelDelegate {
    func characterHasData() {
        updateView()
    }
}
