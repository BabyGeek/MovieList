//
//  ContentView.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel: MoviesViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.movies, id: \.self) { movie in
                        NavigationLink(value: movie) {
                            MoviePreviewView(movie: movie)
                        }
                    }
                    .navigationDestination(for: Movie.self) { movie in
                        MovieDetailView(movie: movie) {
                            viewModel.toggleMovieWatchlist(movie)
                        }
                        .navigationBarTitleDisplayMode(.inline)
                    }
                    .navigationDestination(for: URL.self) { trailerURL in
                        TrailerWebView(trailerURL: trailerURL)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sort") {
                        viewModel.showSortConfirmDialog.toggle()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .confirmationDialog("Sort Movies", isPresented: $viewModel.showSortConfirmDialog) {
                Button("Title") {
                    viewModel.sortBy(\.title)
                }
                
                Button("Release Date") {
                    viewModel.sortBy(\.releaseDate)
                }
            }
        }
        .accentColor(Color(.label))
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: .init())
    }
}
