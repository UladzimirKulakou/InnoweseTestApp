//
//  ContentView.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 19.04.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var pokemonFetcher = PokemonFetcher()
    var body: some View{
        

        
        if pokemonFetcher.isLoading {
            LoadingView()
        } else if pokemonFetcher.errorMessage != nil {
            ErrorView(pokemonFetcher: pokemonFetcher)
        } else {
            PokemonListView()
        }
//        Text("Hello")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
