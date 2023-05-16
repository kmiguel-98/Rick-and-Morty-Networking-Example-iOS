//
//  Character.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

struct Location {
    let name: String
    let url: String
}

struct Character: Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
