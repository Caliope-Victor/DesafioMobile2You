//
//  ContentView.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 22/07/22.
//

import SwiftUI

struct MovieDetailsView: View {
    @StateObject private var viewModel = MovieDetailsViewModel()
    var movieId: Int
    var body: some View {
        ScrollView{
            SelectedMovieView(viewModel: viewModel)
            Spacer()
        }
        .onReceive(viewModel.$selectedMovie){_ in
            viewModel.updateSelectedMovie(id: movieId)
        }
        .onReceive(viewModel.$similarMovies){ _ in
            viewModel.updateSimilarMovies(id: movieId)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieId: 616037)
    }
}
