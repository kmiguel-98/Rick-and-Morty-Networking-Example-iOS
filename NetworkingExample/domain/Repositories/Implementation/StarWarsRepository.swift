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
    
    var implementationClass: any StarWarsAPIRepresentable {
        switch self {
        case .MockStarWarsApi: return PeopleMockStarWarsAPI.shared
        case .StarWarsApi: return PeopleStarWarsAPI.shared
        }
    }
}


final class StarWarsRepository {
    
    var api: StarWarsAPIs = .MockStarWarsApi
    
    ///CharacterRepository
    /// - parameter api: StarWarsAPIs value (use this parameter to change the data origin).
    /// - returns: None
    ///
    init(_ api: StarWarsAPIs?) {
        
        if let api { self.api = api }
    }
}
extension StarWarsRepository: PeopleRepository {
    
    func getPeople() async -> Result<[People], Failure> {
        guard let _api = api.implementationClass as? PeopleStarWarsAPIRepresentable else { return .failure(Failure.repositoryError)}
        return await _api.fetchPeople()
    }
}
