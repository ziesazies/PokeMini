//
//  PokemonDetailViewController.swift
//  PokeMini
//
//  Created by Alief Ahmad Azies on 11/12/22.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
//    var pokemon: Pokemon?
    var name: String?

    @IBOutlet weak var detailPokemonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailPokemonLabel.text = name
    }
    
//    @IBAction func saveButtonTapped(_ sender: Any) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.viewContext
//
//        MyPokemonData.insert(pokemon: pokemon, context: context)
//        appDelegate.saveContext()
//    }

}

extension UIViewController {
    func navigateToPokemonDetail(_ pokemon: Pokemon? = nil) {
//func navigateToPokemonDetail(_ name: String? = nil) {
        let storyboard = UIStoryboard(name: "PokemonList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "pokemonDetail") as! PokemonDetailViewController
//        viewController.pokemon = name
        viewController.name = pokemon?.name
        
        navigationController?.pushViewController(viewController, animated: true)
                
    }
}
