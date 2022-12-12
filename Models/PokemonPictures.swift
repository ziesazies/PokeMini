//
//  PokemonPictures.swift
//  PokeMini
//
//  Created by Alief Ahmad Azies on 12/12/22.
//

import Foundation

struct PokemonPictures: Decodable {
    let homeImageURL: String
    
    enum ContainerKeys: String, CodingKey {
        case other
    }
    
    enum OtherKeys: String, CodingKey {
        case home
    }
    
    enum HomeKeys: String, CodingKey {
        case frontImageURL = "front_default"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerKeys.self)
        let otherContainer = try container.nestedContainer(keyedBy: OtherKeys.self, forKey: PokemonPictures.ContainerKeys.other)
        let homeContainer = try otherContainer.nestedContainer(keyedBy: HomeKeys.self, forKey: PokemonPictures.OtherKeys.home)
        
        self.homeImageURL = try homeContainer.decode(String.self, forKey: HomeKeys.frontImageURL)
    }
}
