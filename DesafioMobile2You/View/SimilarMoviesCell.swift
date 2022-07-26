//
//  SimilarMoviesCell.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 26/07/22.
//

import SwiftUI

struct SimilarMoviesCell: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    var body: some View {
        VStack(alignment: .leading){
            ForEach(viewModel.similarMovies.results){ movie in
                NavigationLink(destination: MovieDetailsView(movieId: movie.id)){
                    HStack(alignment: .center){
                        AsyncImage(url: URL(string: movie.urlImage)) { image in
                            (image.image ?? Image(uiImage: UIImage()))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: viewModel.frame.width * 0.14)
                                
                        }
                        VStack(alignment: .leading){
                            Text(movie.title)
                                .font(.title3)
                                .fontWeight(.medium)
                                .lineLimit(1)
                                .foregroundColor(.adaptableColor)
                            HStack{
                                Text(movie.release_date?.prefix(4) ?? "")
                                    .font(.caption)
                                    .foregroundColor(.adaptableColor)
                                Text(viewModel.formatteGenres(ids: movie.genre_ids ?? []))
                                    .font(.caption)
                                    .foregroundColor(.adaptableColor)
                                    .lineLimit(1)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SimilarMoviesCell_Previews: PreviewProvider {
    static var previews: some View {
        SimilarMoviesCell(viewModel: MovieDetailsViewModel())
    }
}
