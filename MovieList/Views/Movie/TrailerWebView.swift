//
//  TrailerWebView.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import SwiftUI
import WebKit

struct TrailerWebView: View {
    let trailerURL: URL
    
    var body: some View {
        WebView(url: trailerURL)
            .ignoresSafeArea(.container, edges: .bottom)
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct TrailerWebView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerWebView(trailerURL: URL(string: Movie.sample.trailerLink)!)
    }
}
