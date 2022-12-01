//
//  MovieRowView.swift
//  Flix_Rewrite
//
//  Created by Siobahn Devlin on 11/16/22.
//

import SwiftUI

struct MovieRowView: View {
    let movieTitle: String
    let overview: String
    let posterUrl: String
    let vote_average: Double
    
    init(movieTitle: String, overview: String, posterUrl: String, vote_average: Double) {
        self.movieTitle = movieTitle
        self.overview = overview
        self.posterUrl = posterUrl
        self.vote_average = vote_average
    }
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: posterUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .scaledToFit()
                .frame(width: 130, height: 155)
            VStack(alignment: .leading) {
                Text(movieTitle)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Rating: \(vote_average, specifier: "%.1f") / 10")
                Text(overview)
                    .font(.system(size: 17))
                    .lineLimit(3)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movieTitle: "test title", overview: "test overview", posterUrl: "nada", vote_average: 10)
    }
}
