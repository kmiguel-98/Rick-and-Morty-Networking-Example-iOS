//
//  RickAndMortyRepository.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

enum RickAndMortyAPIs {
    case RickAndMortyMockApi
    case RickAndMortyApi
    
    var implementationClass: any RickAndMortyAPIRepresentable  {
        switch self {
        case .RickAndMortyMockApi: return RickAndMortyMockAPI.shared
        case .RickAndMortyApi: return RickAndMortyAPI.shared
        }
    }
}

final class RickAndMortyRepository {
    
    var api: RickAndMortyAPIs = .RickAndMortyApi
    
    init(_ api: RickAndMortyAPIs?) {
        
        if let api { self.api = api }
    }
}

extension RickAndMortyRepository: CharacterRepository {
    
    func getCharacters() async -> Result<[Character], Failure> {
        guard let _api = api.implementationClass as? CharacterRickAndMortyAPIRepresentable else { return .failure(Failure.repositoryError) }
        return await _api.fetchCharacters()
    }
}
