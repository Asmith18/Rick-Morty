//
//  ResultError.swift
//  RickAndMorty
//
//  Created by adam smith on 10/17/22.
//

import Foundation

enum ResultError: LocalizedError {
    case requestError(Error)
    case badURL
    case couldNotUnwrap
    case errorDecoding
    case noData
  
    var localizedDescription: String {
        switch self {
        case .requestError(let error):
            return "Error performing the task: \(error.localizedDescription)"
        case .badURL:
            return "Unable to make the request with the given URL"
        case .couldNotUnwrap:
            return "Error parsing requested data"
        case .errorDecoding:
            return "Error ecountered when decoding the data"
        case .noData:
            return "Error No Data"
        }
    }
}
