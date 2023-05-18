//
//  RickAndMortyRepositoryRepresentable.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

protocol RickAndMortyRepositoryRepresentable { }

protocol RickAndMortyCharacterRepositoryRepresentable: AnyObject, RickAndMortyRepositoryRepresentable {
    
    var _api: RickAndMortyAPIs { get set }
    
    func  getCharacters(page: String) async -> Result<[Character], Failure>
    
    func  getSingleCharacter(id: String) async -> Result<Character, Failure>
}
