//
//  RickAndMortyAPIRepresentable.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

protocol RickAndMortyAPIRepresentable {

    var session: URLSession { get }
}

protocol CharacterRickAndMortyAPIRepresentable: RickAndMortyAPIRepresentable {
    
    func fetchCharacters(page: String) async -> Result<[Character], Failure>
    
    func fetchSingleCharacter(id: String) async -> Result<Character, Failure>
}
