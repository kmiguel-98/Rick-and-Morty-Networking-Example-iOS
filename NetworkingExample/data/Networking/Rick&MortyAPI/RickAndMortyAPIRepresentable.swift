//
//  RickAndMortyAPIRepresentable.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

protocol RickAndMortyAPIRepresentable { }

protocol CharacterRickAndMortyAPIRepresentable: RickAndMortyAPIRepresentable {
    
    func fetchCharacters() async -> Result<[Character], Failure>
}
