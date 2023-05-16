//
//  CharacterRickAndMortyAPI.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

extension LocationDTO {
    func toLocationModel() -> Location {
        return Location(name: self.name ?? "", url: self.url ?? "")
    }
}

extension CharacterDTO {
    
    func toCharacterModel() -> Character {
        return Character(
            id: self.id ?? Int.random(in: (3000...10000)),
            name: self.name ?? "",
            status: self.status ?? "",
            species: self.species ?? "",
            type: self.type ?? "",
            gender: self.gender ?? "",
            origin: self.origin?.toLocationModel() ?? Location(name: "", url: ""),
            location: self.location?.toLocationModel() ?? Location(name: "", url: ""),
            image: self.image ?? "",
            episode: self.episode ?? [],
            url: self.url ?? "",
            created: self.created ?? "")
    }
}

final class RickAndMortyAPI {
    
    static let shared = RickAndMortyAPI()
    
    init() { }
}

extension RickAndMortyAPI: CharacterRickAndMortyAPIRepresentable {
    
    func fetchCharacters() async -> Result<[Character], Failure> {
        
        guard let url = URL(string: "\(Constants.RICK_AND_MORTY_API_BASE_URL)/character") else { return .failure(Failure.urlConstructError) }
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
            
            return .success(characterResponse.results?.compactMap { $0.toCharacterModel() } ?? [])
            
        } catch {
            return .failure(Failure.decodingError)
        }
    }
}
