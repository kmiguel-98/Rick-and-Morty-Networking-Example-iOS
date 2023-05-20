//
//  LocationDTO.swift
//  NetworkingExample
//
//  Created by Miguel on 5/19/23.
//

import Foundation

struct LocationDTO: Codable {
    let name: String?
    let url: String?
}

extension LocationDTO {
    
    func toLocationObject() -> Location {
        return Location(name: self.name ?? "", url: URL(string: self.url!))
    }
}
