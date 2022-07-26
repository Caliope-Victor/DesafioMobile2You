//
//  Genres.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 25/07/22.
//

import Foundation

struct Genre: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
}

struct Genres: Decodable {
    var genres: [Genre]?
}
