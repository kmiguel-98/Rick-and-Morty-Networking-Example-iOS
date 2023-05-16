//
//  StarWarsCharacterAPI.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import Foundation

extension PeopleDTO {
    
    func toPeopleModel() -> People {
        return People(
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
            edited: self.edited ?? "" )
    }
}

final class PeopleStarWarsAPI {
    
    static let shared = PeopleStarWarsAPI()
    
    init() { }
}

extension PeopleStarWarsAPI: PeopleStarWarsAPIRepresentable {
    
    func fetchPeople() async -> Result<[People], Failure> {
        
        guard let url = URL(string: "\(Constants.STAR_WARS_API_BASE_URL)people/") else { return  .failure(Failure.decodingError) }
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let peopleResponse =  try decoder.decode(PeopleResponse.self, from: data)
            
            return .success(peopleResponse.results?.compactMap { $0.toPeopleModel() } ?? [])
        } catch {
            return .failure(Failure.decodingError)
        }
    }
}



