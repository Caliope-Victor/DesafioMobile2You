//
//  Service.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 25/07/22.
//

import Foundation

class MovieService: Services {
    
    /// Get the information of a movie
    /// - Parameters:
    ///   - id: The movie id
    ///   - completion: Return the result of the request <Movie, MovieError>
    func getMovie(with path: String, completion: @escaping (Result<Movie, MovieError>) -> ()) {
        guard let url = URL(string: path) else { return }
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data else {
                completion(.failure(.dataIsEmpty))
                return
            }
            guard let _ = error else {
                completion(.failure(.errorNotNil))
                return
            }
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(Movie.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.dataNotLoaded))
            }
        }.resume()
    }
    
    /// Get all the similar movie of a givem movie
    /// - Parameters:
    ///   - id: The movie id
    ///   - completion: Return the result of the request <[Movie], MovieError>
    func getSimilars(with path: String, completion: @escaping (Result<Movies, MovieError>) -> ()) {
        guard let url = URL(string: path) else { return }
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data else {
                completion(.failure(.dataIsEmpty))
                return
            }
            guard let _ = error else {
                completion(.failure(.errorNotNil))
                return
            }
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(Movies.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.dataNotLoaded))
            }
        }.resume()
    }
}
