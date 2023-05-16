//
//  Repositories.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import Foundation

protocol StarWarsAPIRepresentable { }

protocol PeopleStarWarsAPIRepresentable: StarWarsAPIRepresentable {
    
    func fetchPeople() async -> Result<[People], Failure>
}
