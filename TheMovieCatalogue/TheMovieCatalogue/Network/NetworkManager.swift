//
//  NetworkManager.swift
//  TheMovieCatalogue
//
//  Created by Gerardo Leal on 29/06/23.
//

import Foundation

struct NetworkManager {
    let session = URLSession.shared
    let decoder = Decoder()
    
    func fetchMovie(from url: URL, completion: @escaping (Movie?) -> ()){
        let urlRequest = URLRequest(url: url)
        var movie: Movie?
        let task = session.dataTask(with: urlRequest) { data, _, error in
            guard let data = data else {
                print("Error: \(String(describing: error))")
                return
            }
            do {
                movie = try decoder.decodeMovie(from: data)
                completion(movie)
            } catch let error{
                print("NetworkManager: Fetch movie error: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchPopular(from url:URL) -> PopularMovies {
        let urlRequest = URLRequest(url: url)
        var populars = PopularMovies(page: nil, results: nil)
        let task = session.dataTask(with: urlRequest) { data, _, error in
            guard let data = data else {
                print("Error: \(String(describing: error))")
                return
            }
            do {
                populars = try decoder.decodePopulars(from: data)
            } catch let error{
                print("Fetch popular error: \(error)")
            }
        }
        task.resume()
        return populars
    }
}
