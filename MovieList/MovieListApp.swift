//
//  MovieListApp.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import SwiftUI

@main
struct MovieListApp: App {
    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: .init())
        }
    }
}
