//
//  HomeScreenViewModel.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import Foundation

final class HomeScreenViewModel {
    
    let useCases: CharacterUseCases
    
    var characterListDidChange: (([Character]) -> Void)?
    
    var errorDidChange: ((Error?) -> Void)?
    
    private(set) var characters: [Character] = [] {
        didSet {
            characterListDidChange?(characters)
        }
    }
    
    var error: Error? = nil {
        didSet {
            errorDidChange?(error)
        }
    }
    
    init(_ useCases: CharacterUseCases) {
        self.useCases = useCases
    }
    
    // MARK: View Lifecycle
    
    func viewDidLoad() {
        getCharacters()
    }
    
    private func getCharacters() {
        
        Task {
            let response = await self.useCases.getCharacters()
            
            switch response {
            case .success(let characterList):
                self.characters = characterList
            case .failure(let error):
                self.error = error
            }
        }
    }
}
