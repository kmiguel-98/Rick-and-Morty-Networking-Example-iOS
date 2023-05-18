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
    
    var session: URLSession { URLSession.shared }
    
    func fetchCharacters(page: String) async -> Result<[Character], Failure> {
        
        //Return Mock data from here!
        return .success([])
    }
    
    func fetchSingleCharacter(id: String) async -> Result<Character, Failure> {
        
        //Return Mock data from here!
        return .failure(Failure.decodingError)
    }
}
