//
//  PokemonDetailFetcher.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 22.04.23.
//

import Foundation

class PokemonDetailFetcher: ObservableObject {
    @Published var pokemonsDetail = PokemonFullView()
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    

    init(url: String) {

        fetchDetail(url: url)


    }

    func fetchDetail(url: String) {
        isLoading = true
        errorMessage = nil

        let service = APIService()
        let url = URL(string: url)
        service.fetch(PokemonFullView.self, url: url) { [unowned self] result in

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
                    self.pokemonsDetail = pokemonsList
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
