//
//  Repositories.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import Foundation

protocol CharacterRepositoryRepresentable {
    
    func getCharacters() async -> [Character]
}
