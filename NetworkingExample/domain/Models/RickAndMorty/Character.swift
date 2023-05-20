//
//  Character.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

enum Gender: String {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "Unknown"
}

enum Status: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}

struct Character: Hashable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin: Location
    let location: Location
    let image: URL?
    let episode: [String]
    let url: URL?
    let created: String
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
