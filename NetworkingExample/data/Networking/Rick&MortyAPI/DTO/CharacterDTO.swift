//
//  Character.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

struct CharacterDTO: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: LocationDTO?
    let location: LocationDTO?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

extension CharacterDTO {
    
    func toCharacterObject() -> Character {
        return Character(
            id: self.id ?? Int.random(in: (3000...10000)),
            name: self.name ?? "",
            status: Status(rawValue: self.status ?? "Unknown") ?? .unknown,
            species: self.species ?? "",
            type: self.type ?? "",
            gender: Gender(rawValue: self.gender ?? "Unknown") ?? .unknown,
            origin: self.origin?.toLocationObject() ?? Location(name: "", url: nil),
            location: self.location?.toLocationObject() ?? Location(name: "", url: nil),
            image: URL(string: self.image!),
            episode: self.episode ?? [],
            url: URL(string: self.url!),
            created: self.created ?? "")
    }
}
