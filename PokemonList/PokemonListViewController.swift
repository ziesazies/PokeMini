//
//  PokemonListViewController.swift
//  PokeMini
//
//  Created by Alief Ahmad Azies on 11/12/22.
//

import UIKit

class PokemonListViewController: UIViewController {

    @IBOutlet weak var pokemonListCollectionView: UICollectionView!
    
    var pokemon: [Pokemon] = []
    var pokemonDetail: [PokemonDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonListCollectionView.dataSource = self
        pokemonListCollectionView.delegate = self
        
        loadPokemon()
//        loadDetailPokemon()
    }
    
    func loadPokemon() {
        PokemonProvider.shared.loadPokemon {
            response in
            switch response{
            case.success(let pokemon):
                self.pokemon = pokemon
                self.pokemonListCollectionView.reloadData()
            case .failure(let error):
                print("Error load pokemon news: \(error.localizedDescription)")
            }
        }
    }
    
//    func loadDetailPokemon() {
//        PokemonProvider.shared.loadDetailPokemon(pokemon: Pokemon, completion: {
//            response in
//            switch response{
//            case.success(let pokemonDetail):
//                self.pokemonDetail = pokemonDetail
//                self.pokemonListCollectionView.reloadData()
//            case .failure(let error):
//                print("Error load detail Pokemon: \(error.localizedDescription)")
//            }
//        })
//    }
    

}

extension PokemonListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return pokemon.count
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemon_cell", for: indexPath) as! PokemonListCollectionViewCell
        
//        cell.nameLabel.text = "\(indexPath.item + 1)"
        let pokemon = pokemon[indexPath.item]
        cell.nameLabel.text = pokemon.name
        
        return cell
        
    }
}

extension PokemonListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigateToPokemonDetail(pokemon[indexPath.item])
//        navigateToPokemonDetail(Pokemon()
//        navigateToPokemonDetail(pokemon[indexPath.item])
    }
}
