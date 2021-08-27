//
//  MovieStore.swift
//  SwiftUI-MovieApp
//
//  Created by Arpit Dixit on 28/08/21.
//

import Foundation

struct MovieReponse: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    
    let imdbID: String
    let title: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case poster = "Poster"
    }
}

class MovieStore: ObservableObject {
    
    @Published var movies = [Movie]()
    func getAll() {
        guard let url = URL(string: "https://omdbapi.com/?s=Ring&page=2&apikey=af7af6ca") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data, error == nil else {
                return
            }
            
            let movieResponse = try? JSONDecoder().decode(MovieReponse.self, from: data)
            if let movieResponse = movieResponse {
                DispatchQueue.main.async {
                    self.movies = movieResponse.movies
                }
            }
        }.resume()
    }
}
