//
//  APIError.swift
//  InnowiseTestApp
//
//  Created by Владимир  on 21.04.23.
//

import Foundation

enum APIError: Error {
    case badURL
case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        // user feedback
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse(_):
            return "Sorry, conection faild."
        case .url(let error):
            return error?.localizedDescription ?? "Sorry, something went wrong."
        }
    }
    
    var description: String {
        
        switch self {
        case .unknown:
            return "Unknowned error."
        case .badURL:
            return "Invalid URL."
        case .url(let error):
            return error?.localizedDescription ?? "URL session error."
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(statusCode)"
        }
    }
}
