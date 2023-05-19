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
    
    internal var _api: RickAndMortyAPIs = .RickAndMortyApi
    
    init(_ api: RickAndMortyAPIs?) {
        
        if let api { self._api = api }
    }
}

extension RickAndMortyRepository: RickAndMortyCharacterRepositoryRepresentable {
    
    var api:  CharacterRickAndMortyAPIRepresentable {
        _api.implementationClass as! CharacterRickAndMortyAPIRepresentable
    }
    
    func getCharacters(page: String) async -> Result<[Character], Failure> {
        
        return await api.fetchCharacters(page: page)
    }
    
    func getSingleCharacter(id: String) async -> Result<Character, Failure> {
        
        return await api.fetchSingleCharacter(id: id)
    }
}
