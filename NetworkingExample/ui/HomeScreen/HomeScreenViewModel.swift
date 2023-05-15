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
    
    var characters: [Character] = [] {
        didSet {
            characterListDidChange?(characters)
        }
    }
    
    init(useCases: CharacterUseCases) {
        self.useCases = useCases
    }
    
    // MARK: View Lifecycle
    
    func viewDidLoad() {
        getCharacters()
    }
    
    private func getCharacters() {
        
        Task {
            characters = await useCases.getCharacters()
        }
    }
}
