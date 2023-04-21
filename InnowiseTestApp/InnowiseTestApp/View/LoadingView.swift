//
//  LoadingView.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 21.04.23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("😡").font(.system(size: 40))
            ProgressView()
            Text("Getting the pokemons...")
            
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
