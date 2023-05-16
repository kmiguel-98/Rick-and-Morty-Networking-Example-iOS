//
//  CharacterUseCases.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

final class CharacterUseCases {
    
    /*
     Here u can change the data origin
     */
    let api = RickAndMortyAPIs.RickAndMortyApi
    
    lazy var repository: RickAndMortyRepository = { RickAndMortyRepository(self.api) }()
    
    func getCharacters() async -> Result<[Character], Failure> {
        return await repository.getCharacters()
    }
}
