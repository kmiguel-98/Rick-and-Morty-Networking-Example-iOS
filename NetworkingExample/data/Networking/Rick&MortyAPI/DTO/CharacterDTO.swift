//
//  Character.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

struct LocationDTO: Codable {
    let name: String?
    let url: String?
}

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

struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct CharacterResponse: Codable {
    let info: Info?
    let results: [CharacterDTO]?
}
