//
//  PokemonProvider.swift
//  PokeMini
//
//  Created by Alief Ahmad Azies on 12/12/22.
//

import Foundation
import Alamofire

let BASE_URL = "https://pokeapi.co/api/v2"

class PokemonProvider {
    static let shared: PokemonProvider = PokemonProvider()
    private init() {}
    
    func loadPokemon(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        AF.request("\(BASE_URL)/pokemon", method: .get, parameters: ["limit": 100]).responseData {
            dataResponse in
            if let data = dataResponse.data {
                do {
                    let response = try JSONDecoder().decode(PokemonResponse.self, from: data)
                    completion(.success(response.results))
                }
                catch {
                    completion(.failure(error))
                }
            }
            else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Oops! Something went wrong"])
                completion(.failure(error))
            }
        }
    }
}
