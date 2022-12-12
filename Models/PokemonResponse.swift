//
//  PokemonResponse.swift
//  PokeMini
//
//  Created by Alief Ahmad Azies on 12/12/22.
//

import Foundation

struct PokemonResponse: Decodable {
    let results: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([Pokemon].self, forKey: .results) ?? []
    }
}
