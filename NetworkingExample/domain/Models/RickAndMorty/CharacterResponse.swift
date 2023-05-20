//
//  CharacterResponse.swift
//  NetworkingExample
//
//  Created by Miguel on 5/19/23.
//

import Foundation

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
