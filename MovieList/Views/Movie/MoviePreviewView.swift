//
//  MoviePreviewView.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import SwiftUI

struct MoviePreviewView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            Image(movie.image)
                .resizable()
                .frame(width: 100, height: 150)
                .shadow(radius: 5, y: 2)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(movie.title) (\(movie.releaseYear))")
                        .font(.title3)
                        .fontWeight(.heavy)
                    
                    Text("\(movie.durationHuman) - \(movie.genres.joined(separator: ", "))")
                        .font(.callout)
                        .foregroundColor(Color(.systemGray))
                }
                
                if movie.inWatchlist {
                    Text("On my watchlist".uppercased())
                        .font(.system(size: 12))
                        .fontWeight(.heavy)
                        
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct MoviePreviewView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePreviewView(movie: .sample)
    }
}
