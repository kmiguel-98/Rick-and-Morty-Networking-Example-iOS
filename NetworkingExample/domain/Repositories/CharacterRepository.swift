//
//  MoviesRepository.swift
//  NetworkingExample
//
//  Created by User-T on 5/13/23.
//

import Foundation

enum StarWarsAPIs {
    case MockStarWarsApi
    case StarWarsApi
    
    var implementationClass: any CharacterStarWarsAPIRepresentable {
        switch self {
        case .MockStarWarsApi: return CharacterMockStarWarsAPI.shared
        case .StarWarsApi: return CharacterStarWarsAPI.shared
        }
    }
}


final class CharacterRepository {
    
    let api: any CharacterStarWarsAPIRepresentable
    
    ///CharacterRepository
    /// - parameter api: StarWarsAPIs value (use this parameter to change the data origin).
    /// - returns: None
    ///
    init(_ api: StarWarsAPIs = .MockStarWarsApi) {
        self.api = api.implementationClass
    }
}

extension CharacterRepository: CharacterRepositoryRepresentable {
    
    func getCharacters() async -> [Character] {
        return await api.fetchCharacters()
    }
}
