//
//  DetailsView.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import SwiftUI

struct DetailsView: View {
    let genres: [String]
    let releaseDate: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Details")
                .font(.title3)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 12) {
                VStack(alignment: .trailing) {
                    Text("Genre")
                    Text("Release date".capitalized)
                }
                .bold()
                .font(.body)
                
                VStack(alignment: .leading) {
                    Text(genres.joined(separator: ", "))
                    Text(releaseDate)
                }
                .foregroundColor(Color(.systemGray))
                .font(.body)
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(genres: Movie.sample.genres, releaseDate: Movie.sample.releaseDateHuman)
    }
}
