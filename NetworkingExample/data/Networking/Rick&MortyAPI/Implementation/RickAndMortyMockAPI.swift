//
//  RickAndMortyMockAPIs.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

final class RickAndMortyMockAPI {
    
    static let shared = RickAndMortyMockAPI()
    
    init() { }
}

extension RickAndMortyMockAPI: CharacterRickAndMortyAPIRepresentable {
    
    
    func fetchCharacters(page: String) async -> Result<[Character], Failure> {
        return .success([])
    }
    
    func fetchSingleCharacter(page: String) async -> Result<Character, Failure> {
        return .success([])
    }
}
