//
//  CharacterSearchService.swift
//  RickAndMorty
//
//  Created by adam smith on 10/18/22.
//

import Foundation

struct CharacterSearchService {
    
    private let apiService = APIService()
    func fetchcharacterList(for endPoint: RMEndpoint, completion: @escaping (Result<TopLevelDict, ResultError>) -> Void) {
        
        guard let finalURL = endPoint.fullURL else {
            completion(.failure(.badURL))
            return
        }
                       
        let urlRequest = URLRequest(url: finalURL)
                        
        apiService.perform(urlRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let tld =  try JSONDecoder().decode(TopLevelDict.self, from: data)
                    completion(.success(tld))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
