//
//  CharacterUseCases.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

final class RickAndMortyCharacterUseCases {
    
    /*
     Here u can change the data origin
     */
    var api = RickAndMortyAPIs.RickAndMortyApi
    
    lazy var repository: RickAndMortyRepository = { RickAndMortyRepository(self.api) }()
    
    func getCharacters(page: String) async -> Result<[Character], Failure> {
        
        return await repository.getCharacters(page: page)
    }
    
    func getSingleCharacter(id: String) async -> Result<Character, Failure> {
        
        return await repository.getSingleCharacter(id: id)
    }
}
