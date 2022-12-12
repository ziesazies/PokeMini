//
//  PokemonDetail.swift
//  PokeMini
//
//  Created by Alief Ahmad Azies on 12/12/22.
//

import Foundation

struct PokemonDetail: Decodable {
    let id: Int
    
    let name: String
    
    let types: [Types]
    
    let moves: [Moves]
    
    let pictures: [PokemonPictures]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case moves
        case pictures
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        types = try values.decodeIfPresent([Types].self, forKey: .types) ?? []
        moves = try values.decodeIfPresent([Moves].self, forKey: .moves) ?? []
        pictures = try values.decodeIfPresent([PokemonPictures].self, forKey: .pictures) ?? []
    }
}

struct Types: Decodable {
    let slot: Int
    let type: [PokemonType]
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        slot = try values.decodeIfPresent(Int.self, forKey: .slot) ?? 0
        type = try values.decodeIfPresent([PokemonType].self, forKey: .type) ?? []
    }
}

struct PokemonType: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}

struct Moves: Decodable {
    let move: [Move]
}

struct Move: Decodable {
    let name: String
    let url: String
}

