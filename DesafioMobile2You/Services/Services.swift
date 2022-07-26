//
//  MovieServices.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 25/07/22.
//

import Foundation

protocol Services {
    func getAllGenres(with path: String, completion: @escaping (Result<Genres, MovieError>) -> ())
    func getMovie(with path: String, completion: @escaping (Result<Movie, MovieError>) -> ())
    func getSimilars(with path: String, completion: @escaping (Result<Movies, MovieError>) -> ())
}
