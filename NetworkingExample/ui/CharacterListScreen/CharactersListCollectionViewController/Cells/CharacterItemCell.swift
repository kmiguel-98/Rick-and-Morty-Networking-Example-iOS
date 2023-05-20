//
//  CharacterItemCell.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import UIKit
import Nuke

final class CharacterItemCell: UICollectionViewCell, NibLoadable {

    @IBOutlet private weak var characterUIImageView: UIImageView!
    @IBOutlet private weak var nameUILabel: UILabel!
    @IBOutlet private weak var StatusAndSpeciesUILabel: UILabel!
    @IBOutlet private weak var LastKnownLocationUILabel: UILabel!
    @IBOutlet private weak var originLocationUILabel: UILabel!

    func configure(character: Character) {
        
        nameUILabel.text = character.name
        StatusAndSpeciesUILabel.text = "\(character.status) - \(character.species)"
        LastKnownLocationUILabel.text = character.location.name
        originLocationUILabel.text = character.origin.name
            
        if let url = character.image {
            
            Nuke.loadImage(with: url, into: characterUIImageView)
        }
    }
}
