//
//  MovieDetailsViewModel.swift
//  DesafioMobile2You
//
//  Created by Victor Henrique Caliope Soares on 26/07/22.
//

import Foundation
import UIKit

final class MovieDetailsViewModel: ObservableObject {
    
    @Published var selectedMovie: Movie
    @Published var similarMovies: Movies
    private var service = MovieService()
    
    var frame = UIScreen.main.bounds
    
    init(){
        self.selectedMovie = Movie(id: 1, title: "Default")
        self.similarMovies = Movies(results: [])
//        updateSimilarMovies(id: 616037) // Id of default movie
//        updateSelectedMovie(id: 616037) // Id of default movie
    }
    
    func updateSelectedMovie(id: Int){
        let defaultURL = "https://api.themoviedb.org/3/movie/\(id)?api_key=526413961b6de91fefe105d4abb81eea&language=pt-BR"
        service.getMovie(with: defaultURL) { [weak self] result in
            DispatchQueue.main.async {
                do{
                    self?.selectedMovie = try result.get()
                }catch{
                    print(error)
                }
            }
            
        }
    }
    
    func updateSimilarMovies(id: Int){
        let defaultURL = "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=526413961b6de91fefe105d4abb81eea&language=pt-BR"
        service.getSimilars(with: defaultURL){ [weak self] result in
            DispatchQueue.main.async {
                do{
                    self?.similarMovies = try result.get()
                }catch{
                    print(error)
                }
            }
        }
    }
    
}
