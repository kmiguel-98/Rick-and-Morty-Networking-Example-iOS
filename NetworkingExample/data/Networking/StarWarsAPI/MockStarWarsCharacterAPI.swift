//
//  CharacterMockAPI.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import Foundation

final class CharacterMockStarWarsAPI {

    static let shared = CharacterMockStarWarsAPI()
    
    init() { }
}

extension CharacterMockStarWarsAPI: CharacterStarWarsAPIRepresentable {
    
    func fetchCharacters() async -> [Character] {
        let characterList = (0...9).map {
            Character(
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
                edited: "",
                url: "")
        }
        
        return characterList
    }
}
