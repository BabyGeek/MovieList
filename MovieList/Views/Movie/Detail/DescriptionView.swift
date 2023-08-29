//
//  DescriptionView.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import SwiftUI

struct DescriptionView: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Short description")
                .font(.title3)
                .fontWeight(.heavy)
            
            Text(description)
                .foregroundColor(Color(.systemGray))
                .font(.body)
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(description: Movie.sample.description)
    }
}
