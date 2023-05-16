//
//  PeopleMockStarWarsAPI.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import Foundation

final class PeopleMockStarWarsAPI {

    static let shared = PeopleMockStarWarsAPI()
    
    init() { }
}

extension PeopleMockStarWarsAPI: PeopleStarWarsAPIRepresentable {
    
    func fetchPeople() async -> Result<[People], Failure> {
        let peopleList = (0...9).map {
            People(
                name: "Character#\($0)",
                height: "\($0) cm",
                mass: "\($0) kg",
                hair_color: "black",
                skin_color: "nigga",
                eye_color: "brown",
                birth_year: "Jan/26/86",
                gender: "male",
                homeworld: "",
                films: [String](),
                species: [String](),
                vehicles: [String](),
                starships: [String](),
                created: "",
                edited: "")
        }
        
        return .success(peopleList)
    }
}
