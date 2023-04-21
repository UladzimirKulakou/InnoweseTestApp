//
//  PokemonListView.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 21.04.23.
//

import SwiftUI

struct PokemonListView: View {
   // let pokemons = PokemonAPIList(results: [])
    @StateObject var pokemonFetcher = PokemonFetcher()
    var body: some View {
        NavigationView{
            List(pokemonFetcher.pokemonsList.results, id: \.url) { pokemon in
                NavigationLink{
                    PokemonsDetailView(url: pokemon.url)
                } label: {
                    Text(pokemon.name)
                }
                
            }
        }
        
            
        
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
