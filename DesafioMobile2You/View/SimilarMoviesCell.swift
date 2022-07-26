//
//  SimilarMoviesCell.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 26/07/22.
//

import SwiftUI

struct SimilarMoviesCell: View {
    var movie: Movie
    var body: some View {
        Text("Hello, World!")
    }
}

struct SimilarMoviesCell_Previews: PreviewProvider {
    static var previews: some View {
        SimilarMoviesCell(movie: Movie(id: 1, title: "sim"))
    }
}
