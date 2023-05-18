//
//  CharacterDetailViewModel.swift
//  NetworkingExample
//
//  Created by Miguel on 5/17/23.
//

import Foundation

final class CharacterDetailViewModel {
    
    var characterDidChange: ((Character) -> Void)?
    
    private(set) var characters: Character! {
        didSet {
            
            characterDidChange?(characters)
        }
    }
    
    var errorDidChange: ((Error?) -> Void)?
    
    private var error: Error? = nil {
        didSet {
            
            errorDidChange?(error)
        }
    }
    
    private var character: Character!
    private let characterUseCases: RickAndMortyCharacterUseCases
    
    // MARK: Initializers
    init(_ useCases: RickAndMortyCharacterUseCases, id: String) {
        
        characterUseCases = useCases
        getSingleCharacter(id: id)
    }
    
    //MARK: Private Methods
    private func getSingleCharacter(id: String) {
        
        Task {
            let response = await characterUseCases.getSingleCharacter(id: id)
            
            switch response {
            case .success(let character):
                self.character = character
            case .failure(let error):
                self.error = error
            }
        }
    }
}
