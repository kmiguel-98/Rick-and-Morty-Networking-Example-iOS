//
//  CharacterItemCell.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import UIKit

class CharacterItemCell: UICollectionViewCell, NibLoadable {

    @IBOutlet weak var characterUIImageView: UIImageView!
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var StatusAndSpeciesUILabel: UILabel!
    @IBOutlet weak var LastKnownLocationUILabel: UILabel!
    @IBOutlet weak var FirstSeenInUILabel: UILabel!

    func configure(character: Character) {
      
        nameUILabel.text = character.name
        StatusAndSpeciesUILabel.text = "\(character.status) - \(character.species)"
        LastKnownLocationUILabel.text = character.location.name
        FirstSeenInUILabel.text = character.episode.first ?? "unknown"
    }
}

//if let firstSeenIn = character.episode.first {
//    FirstSeenInUILabel.text = firstSeenIn
//}
