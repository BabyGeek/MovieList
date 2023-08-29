//
//  MoviesViewModel.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import Foundation

class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = Movie.samples
    @Published var showSortConfirmDialog: Bool = false
    
    func sortBy<Value>(_ keyPath: KeyPath<Movie, Value>) where Value: Comparable {
        movies.sorted(by: keyPath)
    }
    
    func toggleMovieWatchlist(_ movie: Movie) {
        if let movieIndex = movies.firstIndex(where: { $0.title == movie.title }) {
            var newMovie = movie
            newMovie.inWatchlist.toggle()
            
            movies[movieIndex] = newMovie
        }
    }
}
