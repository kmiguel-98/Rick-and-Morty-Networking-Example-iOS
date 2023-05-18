//
//  ApiError.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import Foundation

enum Failure: Error {
    
    case decodingError
    case urlConstructError
    case APIError(Error)
    case repositoryError
    
    var title: String {
        "Servidor temporalmente no disponible"
    }
    
    var localizedDescription: String {
        "Estamos trabajando para resolver este problema, gracias por su paciencia."
    }
}
