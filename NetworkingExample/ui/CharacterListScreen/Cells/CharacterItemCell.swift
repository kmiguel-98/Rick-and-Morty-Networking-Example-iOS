//
//  CharacterItemCell.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import UIKit
import Nuke

class CharacterItemCell: UICollectionViewCell, NibLoadable {

    @IBOutlet weak var characterUIImageView: UIImageView!
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var StatusAndSpeciesUILabel: UILabel!
    @IBOutlet weak var LastKnownLocationUILabel: UILabel!
    @IBOutlet weak var originLocationUILabel: UILabel!

    func configure(character: Character) {
        
        nameUILabel.text = character.name
        StatusAndSpeciesUILabel.text = "\(character.status) - \(character.species)"
        LastKnownLocationUILabel.text = character.location.name
        originLocationUILabel.text = character.origin.name
        
        if let url = URL(string: character.image){
            Nuke.loadImage(with: url, into: characterUIImageView)
        }
    }
}
