//
//  Pokemon.swift
//  PokeMini
//
//  Created by Alief Ahmad Azies on 10/12/22.
//

import Foundation

struct Pokemon: Decodable {
//    var id: Int64
//    var name: String
//    var type: String
//    var picture: String
//    var moves: [String]
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case url
//    }
//    
//    init (from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        
//        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
//        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
//                                           
//    }
    
    let name: String
    
    let url: String
    
    enum CodingKeys: String, CodingKey{
        case name
        case url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
    
}

