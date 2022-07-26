//
//  MockService.swift
//  DesafioMobile2YouTests
//
//  Created by Victor Henrique Caliope Soares on 25/07/22.
//

import Foundation
@testable import DesafioMobile2You

class MockService: Services {
   
    func getMovie(with path: String, completion: @escaping (Result<Movie, MovieError>) -> ()) {
        
        guard let completPath = Bundle(for: MockService.self).path(forResource: path, ofType: "json") else {
            completion(.failure(.dataIsEmpty))
            return
        }
        
        do{
            let mockData = try Data(contentsOf: URL(fileURLWithPath: completPath), options: .alwaysMapped)
            let decoder = JSONDecoder()
            let result = try decoder.decode(Movie.self, from: mockData)
            completion(.success(result))
        } catch {
            completion(.failure(.dataNotLoaded))
        }
    }
    
    func getSimilars(with path: String, completion: @escaping (Result<Movies, MovieError>) -> ()) {
        
        guard let completPath = Bundle(for: MockService.self).path(forResource: path, ofType: "json") else {
            completion(.failure(.dataIsEmpty))
            return
        }
        
        do{
            let mockData = try Data(contentsOf: URL(fileURLWithPath: completPath), options: .alwaysMapped)
            let decoder = JSONDecoder()
            let result = try decoder.decode(Movies.self, from: mockData)
            completion(.success(result))
        } catch {
            completion(.failure(.dataNotLoaded))
        }
    }
    
}
