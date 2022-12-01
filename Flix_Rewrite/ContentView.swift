//
//  ContentView.swift
//  Flix_Rewrite
//
//  Created by Siobahn Devlin on 11/16/22.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var vm = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.movieList) { movie in
                    NavigationLink(destination: MovieDetailView(
                        movieTitle: movie.title,
                        overview: movie.overview,
                        posterUrl: vm.createPosterUrl(movie.poster_path),
                        backdropUrl: vm.createBackDropUrl(movie.backdrop_path))) {
                        
                            MovieRowView(movieTitle: movie.title, overview: movie.overview, posterUrl: vm.createPosterUrl(movie.poster_path), vote_average: movie.vote_average)
                    }
//                        .listRowSeparatorTint(.black)
//                        .listRowBackground(Color.blue)
                }
            }
            
            .listStyle(.grouped)
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
