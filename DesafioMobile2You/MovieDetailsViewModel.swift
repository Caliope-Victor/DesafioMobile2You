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
    private var allGenres:[Int:String] = [:]
    
    var frame = UIScreen.main.bounds
    
    init(){
        self.selectedMovie = Movie(id: 1, title: "Default")
        self.similarMovies = Movies(results: [])
//        updateSimilarMovies(id: id) // update the selected movie
//        updateSelectedMovie(id: id) // update de similar movies
        getGenres()
    }
    
    func updateSelectedMovie(id: Int){
        let defaultURL = "https://api.themoviedb.org/3/movie/\(id)?api_key=526413961b6de91fefe105d4abb81eea&language=pt-BR"
        service.getMovie(with: defaultURL) { [weak self] result in
            DispatchQueue.main.async {
                do{
                    self?.selectedMovie = try result.get()
                }catch{
                    print(error.localizedDescription)
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
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getGenres() {
        let defaultURL = "https://api.themoviedb.org/3/genre/movie/list?api_key=661d55cc6c18bbd24bfb56171d197d74&language=en-US"
        let service = MovieService()
        do{
            service.getAllGenres(with: defaultURL, completion: { [weak self] result in
                switch result {
                case .success(let genres):
                    genres.genres?.forEach { genre in
                        self?.allGenres[genre.id] = genre.name
                    }
//                    self?.objectWillChange.send()
                case .failure:
                    break
                }
            })
        }
    }
    
    func formatteGenres(ids: [Int]) -> String{
        var format = [String]()
        ids.forEach { id in
            format.append(allGenres[id] ?? "")
        }
        return format.joined(separator: ", ")
    }
    
}
