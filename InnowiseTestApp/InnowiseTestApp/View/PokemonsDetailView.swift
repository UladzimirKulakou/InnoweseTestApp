//
//  PokemonsDetailView.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 21.04.23.
//

import SwiftUI

struct PokemonsDetailView: View {
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: url)){
            picture in
            if let image = picture.image {
                image.resizable()
                .frame(width: 100, height: 100)
            }
        }
    }
}

struct PokemonsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonsDetailView(url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
    }
}
