//
//  RickAndMortyRepositoryRepresentable.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

protocol CharacterRepository {
    
    func  getCharacters() async -> Result<[Character], Failure>
}
