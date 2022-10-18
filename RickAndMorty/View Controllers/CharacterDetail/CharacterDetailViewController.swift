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
    //MARK: - Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterOriginLabel: UILabel!
    @IBOutlet weak var characterLocationLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var characterSpeciesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        characterNameLabel.text     = viewModel.character?.name
        characterOriginLabel.text   = viewModel.character?.origin.name
        characterLocationLabel.text = viewModel.character?.location.name
        characterGenderLabel.text   = viewModel.character?.gender
        characterStatusLabel.text   = viewModel.character?.status
        characterSpeciesLabel.text  = viewModel.character?.species
    }
}
