//
//  Movie.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 25/07/22.
//

import Foundation

struct Movie: Decodable {
    var id: Int
    var genres: [Genre]?
    var title: String
    var popularity: Float?
    var poster_path: String?
    var vote_count: Int?
    var release_date: String?
    
    
    var urlImage: String{
        return "https://image.tmdb.org/t/p/original/\(poster_path ?? "")"
    }
}
