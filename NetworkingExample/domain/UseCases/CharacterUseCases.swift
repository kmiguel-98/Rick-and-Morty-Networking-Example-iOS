//
//  UseCases.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import Foundation


final class CharacterUseCases {
    
    /*
     Here u can change the data origin
     */
    let repository = CharacterRepository(.StarWarsApi)
}

extension CharacterUseCases: CharacterUseCasesRepresentable {
    func getCharacters() async -> [Character] {
        return await repository.getCharacters()
    }
}



