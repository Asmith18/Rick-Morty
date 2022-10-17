//
//  NetworkController.swift
//  RickAndMorty
//
//  Created by adam smith on 10/17/22.
//

import Foundation
import UIKit

struct APIService {
    
    static let baseURLString = "https://rickandmortyapi.com/api"
    static let kCharacter = "character"
    static let kName = "name"
    
    static func fetchCharacter(with searchTerm: String, completion: @escaping (Result<TopLevelDict,ResultError>) -> Void) {
        guard let baseURL = URL(string: baseURLString) else { return }
        let characterURL = baseURL.appendingPathComponent(kCharacter)
        var urlComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
        let nameFilter = URLQueryItem(name: kName, value: searchTerm)
        urlComponents?.queryItems = [nameFilter]
        guard let finalURL = urlComponents?.url else { return }
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error {
                completion(.failure(.requestError(error)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                guard let character = try? JSONDecoder().decode(TopLevelDict.self, from: data) else {
                    completion(.failure(.couldNotUnwrap))
                    return
                }
                completion(.success(character))
            }
            completion(.failure(.errorDecoding))
        } .resume()
    }
    
    static func fetchImage(with ImageURL: String, completion: @escaping (Result<UIImage, ResultError>) -> Void) {
        guard let baseURL = URL(string: ImageURL) else {
            completion(.failure(.couldNotUnwrap))
            return
        }
        
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            if let error {
                completion(.failure(.requestError(error)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                guard let image = UIImage(data: data) else {
                    completion(.failure(.couldNotUnwrap))
                    return
                }
                completion(.success(image))
            }
        }.resume()
    }
}
