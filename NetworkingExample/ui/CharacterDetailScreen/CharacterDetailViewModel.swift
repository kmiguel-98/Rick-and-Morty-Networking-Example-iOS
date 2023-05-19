//
//  CharacterDetailViewModel.swift
//  NetworkingExample
//
//  Created by Miguel on 5/17/23.
//

import Foundation

final class CharacterDetailViewModel {
    
    var characterDidChange: ((Character) -> Void)?
    
    private(set) var character: Character! = nil {
        didSet {
            
            characterDidChange?(character)
        }
    }
    
    var errorDidChange: ((Error?) -> Void)?
    
    private var error: Error? = nil {
        didSet {
            
            errorDidChange?(error)
        }
    }
    
    private let characterUseCases: RickAndMortyCharacterUseCases
    
    // MARK: Initializers
    init(_ useCases: RickAndMortyCharacterUseCases) {
        
        characterUseCases = useCases
    }
    
    //MARK: Public Methods
    func getSingleCharacter(id: String) {
        
        Task {
            let response = await characterUseCases.getSingleCharacter(id: id)
            
            switch response {
            case .success(let character):
                DispatchQueue.main.async {
                    self.character = character
                }
            case .failure(let error):
                self.error = error
            }
        }
    }
}
