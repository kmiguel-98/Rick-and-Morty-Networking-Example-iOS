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
    
    internal let session = URLSession.shared
    
    init() { }
}

extension RickAndMortyAPI: CharacterRickAndMortyAPIRepresentable {
    
    func fetchCharacters(page: String) async -> Result<[Character], Failure> {
        
        guard var urlComponents = URLComponents(string: "\(Constants.RICK_AND_MORTY_API.BASE_URL)/character")  else { return .failure(Failure.urlConstructError) }
        
        urlComponents.queryItems = [URLQueryItem(name: "page", value: page)]
        guard let url = urlComponents.url else { return .failure(Failure.urlConstructError) }
        
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
            
            return .success(characterResponse.results?.compactMap { $0.toCharacterModel() } ?? [])
            
        } catch {
            
            return .failure(Failure.decodingError)
        }
    }
    
    func fetchSingleCharacter(id: String) async -> Result<Character, Failure> {
        
        guard let url = URL(string: "\(Constants.RICK_AND_MORTY_API.BASE_URL)/character/\(id)") else { return .failure(Failure.urlConstructError) }
        
        do {
            
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            print(url)
            let character = try decoder.decode(CharacterDTO.self, from: data)
            
            return .success(character.toCharacterModel())
            
        } catch {
            
            return .failure(Failure.decodingError)
        }
    }
}
