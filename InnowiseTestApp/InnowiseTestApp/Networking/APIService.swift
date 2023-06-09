//
//  APIService.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 21.04.23.
//

import Foundation

struct APIService {
    
    func fetch <T:Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
            
            
            
            
        }
        task.resume()
    }
    
    func fetchAllPokemons(url: URL?, completion: @escaping(Result<PokemonAPIList,APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let pokemons = try decoder.decode(PokemonAPIList.self, from: data)
                    completion(Result.success(pokemons))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
            
            
            
            
        }
        task.resume()
    }
}
