//
//  Service.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 25/07/22.
//

import Foundation

class Service: MovieServices {
    
    /// Get the information of a movie
    /// - Parameters:
    ///   - id: The movie id
    ///   - completion: Return the result of the request <Movie, MovieError>
    func getmovie(with id: Int, completion: @escaping (Result<Movie, MovieError>) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=526413961b6de91fefe105d4abb81eea&language=pt-BR") else { return }
        
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
    func getSimilars(with id: Int, completion: @escaping (Result<[Movie], MovieError>) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=526413961b6de91fefe105d4abb81eea&language=pt-BR") else { return }
        
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
                let result = try decoder.decode([Movie].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.dataNotLoaded))
            }
        }.resume()
    }
}
