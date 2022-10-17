//
//  Characteer.swift
//  RickAndMorty
//
//  Created by adam smith on 10/17/22.
//

import Foundation

struct TopLevelDict: Decodable {
    let info: Info
    let results: [Character]
}

struct Info: Decodable {
    let next: String
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: OriginDictionary
    let location:LocationDictionary
    let image: String
}

struct OriginDictionary: Decodable {
    let name: String
}

struct LocationDictionary: Decodable {
    let name: String
}


