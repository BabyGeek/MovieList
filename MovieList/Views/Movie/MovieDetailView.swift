//
//  MovieDetailView.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import SwiftUI

struct MovieDetailView: View {
    @State private var buttonMaxWidth: CGFloat = .zero
    @State var movie: Movie
    var watchlistAction: () -> ()
    
    
    var body: some View {
        VStack(spacing: 24) {
            Divider()
            
            MainInformationsView(movie: movie) {
                movie.inWatchlist.toggle()
                watchlistAction()
            }
            
            Divider()
            
            DescriptionView(description: movie.description)
            
            Divider()
            
            DetailsView(genres: movie.genres, releaseDate: movie.releaseDateHuman)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    
    private func rectReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { gp -> Color in
            DispatchQueue.main.async {
                binding.wrappedValue = max(binding.wrappedValue, gp.frame(in: .local).width)
            }
            return Color.clear
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .sample) {
            //
        }
    }
}
