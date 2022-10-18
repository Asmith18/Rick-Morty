//
//  CharacterSearchEnpoint.swift
//  RickAndMorty
//
//  Created by adam smith on 10/18/22.
//

import Foundation

enum RMEndpoint {
    
    case name(String)
    case gender(String)
    case species(String)
    case status(String)
    
    var path: String {
        switch self {
        case .name:
            return "name"
        case .gender:
            return "gender"
        case .species:
            return "species"
        case .status:
            return "status"
        }
    }
    
//    fullURL is a property of whatever we give it in the scope
    var fullURL: URL? {
        guard let baseURL = URL(string: "https://rickandmortyapi.com/api/") else { return nil }
        let characterURL = baseURL.appendingPathComponent("character")
        
        switch self {
        case
            .name   (let searchTerm),
            .gender (let searchTerm),
            .species(let searchTerm),
            .status (let searchTerm):
            
            guard var components = URLComponents(url: characterURL, resolvingAgainstBaseURL: true) else { return nil }
            let filterQueryItem = URLQueryItem(name: path, value: searchTerm)
            components.queryItems = [filterQueryItem]
            
            return components.url
        }
    }
}
