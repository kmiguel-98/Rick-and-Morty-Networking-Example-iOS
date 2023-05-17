//
//  RickAndMortyRepositoryRepresentable.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

protocol CharacterRepository {
    
    func  getCharacters(page: String) async -> Result<[Character], Failure>
    
    func  getSingleCharacter(id: String) async -> Result<Character, Failure>
}
