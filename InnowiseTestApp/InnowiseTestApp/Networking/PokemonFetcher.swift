//
//  PokemonFetcher.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 21.04.23.
//

import Foundation

class PokemonFetcher: ObservableObject {
    @Published var pokemonsList = PokemonAPIList(results: [])
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    
    init() {
        
        fetchAllPokemons()
        
    }
    
    func fetchAllPokemons() {
        isLoading = true
        errorMessage = nil
        
       let service = APIService()
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/")
        service.fetchAllPokemons(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
           
            switch result {
                
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print(error.description)
                print(error)
            case .success(let pokemonsList):
                DispatchQueue.main.async {
                    self.pokemonsList = pokemonsList
                }
                
            }
            
        }
    }
    
    static func errorState() -> PokemonFetcher {
        let fetcher = PokemonFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> PokemonFetcher {
        let fetcher = PokemonFetcher()
        
        
        return fetcher
    }
    
    
    
    
}
