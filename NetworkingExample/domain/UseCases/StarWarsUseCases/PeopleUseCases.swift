//
//  UseCases.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import Foundation


final class PeopleUseCases {
    
    /*
     Here u can change the data origin
     */
    let api = StarWarsAPIs.StarWarsApi
    
    lazy var repository: StarWarsRepository = { StarWarsRepository(self.api) }()
    
    func getPeople() async -> Result<[People], Failure> {
        return await repository.getPeople()
    }
}



