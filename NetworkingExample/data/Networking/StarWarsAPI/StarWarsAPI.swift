//
//  Repositories.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import Foundation

protocol CharacterStarWarsAPIRepresentable {
    
    func fetchCharacters() async -> [Character]
}
