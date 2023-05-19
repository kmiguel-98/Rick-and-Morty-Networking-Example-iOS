//
//  CharacterDetailViewController.swift
//  NetworkingExample
//
//  Created by Miguel on 5/18/23.
//

import UIKit
import Nuke

final class CharacterDetailViewController: UIViewController {
    
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var characterSpecieLabel: UILabel!
    @IBOutlet private weak var characterStatusLabel: UILabel!
    @IBOutlet private weak var characterGenderLabel: UILabel!
    @IBOutlet private weak var characterOriginLabel: UILabel!
    @IBOutlet private weak var characterFirstSeenLabel: UILabel!
    
    
    private let viewModel: CharacterDetailViewModel
    private let id: String
    
    init(_ viewModel: CharacterDetailViewModel, id: String) {
        self.viewModel = viewModel
        self.id = id
        super.init(nibName: "CharacterDetailViewController", bundle: Bundle(for: CharacterDetailViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        viewModel.characterDidChange = { [unowned self] character in
            
            let backgroundColor = viewModel.character.gender == "Male"
            ? UIColor(named: "R&MPaletteSeanBlue")
            : UIColor(named: "R&MPaletteRed")
            title = "\(viewModel.character.name)"
            
            customizeNavigationBar(backgroundColor)
            setUI(with: character)
        }
        
        title = ""
        customizeNavigationBar()
        
        super.viewDidLoad()
        
        viewModel.getSingleCharacter(id: id)
    }
    
    private func setUI(with character: Character) {
        characterSpecieLabel.text = character.species
        characterStatusLabel.text = character.status
        characterGenderLabel.text = character.gender
        characterOriginLabel.text = character.origin.name
        characterFirstSeenLabel.text = character.episode.first ?? "unknown"
        
        if let url = URL(string: character.image) {
            
            Nuke.loadImage(with: url, into: characterImageView)
        }
    }
    
    private func customizeNavigationBar(_ backgroundColor: UIColor? = UIColor.white) {
        
        guard let backgroundColor,
              let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let statusBarManager = windowScene.windows.first?.windowScene?.statusBarManager
        else { return }

        let statusBarView = UIView(frame: statusBarManager.statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
        
        navigationController?.navigationBar.barTintColor = backgroundColor
        navigationController?.navigationBar.backgroundColor = backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
}
