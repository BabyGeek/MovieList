//
//  MainInformationsView.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import SwiftUI

struct MainInformationsView: View {
    let movie: Movie
    var watchlistAction: () -> ()
    
    var body: some View {
        HStack {
            Image(movie.image)
                .resizable()
                .frame(width: 150, height: 200)
                .shadow(radius: 5, y: 2)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("\(movie.title)")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 120, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    VStack {
                        Text(movie.rating.formatted())
                            .bold()
                            .font(.title3) +
                        
                        Text("/10")
                            .font(.callout)
                            .foregroundColor(Color(.systemGray))
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Button {
                        watchlistAction()
                    } label: {
                        Label(movie.inWatchlist ? "Remove from watchlist".uppercased() : "Add to watchlist".uppercased(), systemImage: movie.inWatchlist ? "minus" : "plus")
                            .font(.system(size: 10))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .tint(Color(.systemGray))
                    
                    if let trailerURL = URL(string: movie.trailerLink) {
                        NavigationLink(value: trailerURL) {
                            Text("watch trailer".uppercased())
                                .font(.system(size: 10))
                                .frame(maxWidth: .infinity)
                                .padding(5)
                                .foregroundColor(Color(.label))
                                .overlay(
                                    Capsule()
                                        .stroke(Color(.label), lineWidth: 1.5)
                                )
                        }
                    }
                }
                .padding(.trailing)
            }
        }
    }
}

struct MainInformationsView_Previews: PreviewProvider {
    static var previews: some View {
        MainInformationsView(movie: .sample) {
            //
        }
    }
}
