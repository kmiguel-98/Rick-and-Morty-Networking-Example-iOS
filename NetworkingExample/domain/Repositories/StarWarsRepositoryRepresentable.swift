//
//  StarWarsAPIRepresentable.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import Foundation

protocol PeopleRepository {
    
    func getPeople() async -> Result<[People], Failure>
}
