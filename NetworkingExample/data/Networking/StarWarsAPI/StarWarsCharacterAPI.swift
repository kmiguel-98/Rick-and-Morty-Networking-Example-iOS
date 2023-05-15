//
//  StarWarsCharacterAPI.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import Foundation

extension CharacterDTO {
    
    func toCharacterModel() -> Character {
        return Character(
            name: self.name ?? "",
            height: self.height ?? "",
            mass: self.mass ?? "",
            hair_color: self.hair_color ?? "",
            skin_color: self.skin_color ?? "",
            eye_color: self.eye_color ?? "",
            birth_year: self.birth_year ?? "",
            gender: self.gender ?? "",
            homeworld: self.homeworld ?? "",
            films: self.films ?? [],
            species: self.species ?? [],
            vehicles: self.vehicles ?? [],
            starships: self.starships ?? [],
            created: self.created ?? "",
            edited: self.edited ?? "",
            url: self.url ?? "")
    }
}

final class CharacterStarWarsAPI {
    
    static let shared = CharacterStarWarsAPI()
    
    init() { }

}

extension CharacterStarWarsAPI: CharacterStarWarsAPIRepresentable {
    
    func fetchCharacters() async -> [Character] {
        
        guard let url = URL(string: "\(Constants.STARWARSAPIBASEURL)people/") else { return [] }
        let session = URLSession.shared
        let (data, _) = try! await session.data(from: url)
        let decoder = JSONDecoder()
        let characterResponse =  try! decoder.decode(CharacterRequestResponse.self, from: data)
        
        return characterResponse.results?.compactMap { $0.toCharacterModel() } ?? []
    }
}



