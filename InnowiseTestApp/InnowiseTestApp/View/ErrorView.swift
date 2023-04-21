//
//  ErrorView.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 21.04.23.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var pokemonFetcher: PokemonFetcher
    
    var body: some View {
        VStack{
            Text("😭").font(.system(size: 80))
            Text(pokemonFetcher.errorMessage ?? "")
        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(pokemonFetcher: PokemonFetcher())
    }
}
