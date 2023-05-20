//
//  RickAndMortyAPIRepresentable.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

protocol RickAndMortyAPIRepresentable { }

protocol CharacterRickAndMortyAPIRepresentable: AnyObject, RickAndMortyAPIRepresentable {
    
    func fetchCharacters(page: String) async -> Result<[Character], Failure>
    
    func fetchSingleCharacter(id: String) async -> Result<Character, Failure>
}
