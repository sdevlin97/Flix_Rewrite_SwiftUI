//
//  MovieDetailView.swift
//  Flix_Rewrite
//
//  Created by Siobahn Devlin on 11/30/22.
//

import SwiftUI

struct MovieDetailView: View {
    let movieTitle: String
    let overview: String
    let posterUrl: String
    let backdropUrl: String
    
    init(movieTitle: String, overview: String, posterUrl: String, backdropUrl: String) {
        self.movieTitle = movieTitle
        self.overview = overview
        self.posterUrl = posterUrl
        self.backdropUrl = backdropUrl
    }
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: backdropUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(width: 414, height: 339)
                Spacer()
            }
            
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: posterUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(width: 130, height: 155)

                Text(movieTitle)
                    .multilineTextAlignment(.center)
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 36))
                    .padding(10)
                    .frame(alignment: .bottom)
                
                Text(overview)
                    .foregroundColor(.white)
                    .padding(10)
            }
        }.background(Color.black)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieTitle: "Test title", overview: "test overview", posterUrl: "", backdropUrl: "")
    }
}
