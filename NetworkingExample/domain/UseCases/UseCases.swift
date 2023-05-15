//
//  UseCases.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import Foundation

protocol CharacterUseCasesRepresentable {
    
   func getCharacters() async -> [Character]
}
