//
//  ContentViewModel.swift
//  Flix_Rewrite
//
//  Created by Siobahn Devlin on 11/30/22.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var movieResults = [[String: Any]]()
    @Published var movieOverview = ""
    @Published var movieList: [Movie] = []
    @Published var posterUrl: String = ""
    @Published var backdropUrl: String = ""
    
    var moviesDictionary = [[String: Any]]()
    let url: URL
    let request: URLRequest
    let session: URLSession
    
    
    init() {
        self.url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        self.request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        self.session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 let moviesDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 self.movieResults = moviesDictionary["results"] as! [[String: Any]]
                 
                 self.movieList = self.movieResults.map { moviesDict -> Movie in
                     let title = moviesDict["title"] as? String ?? "Error loading title"
                     let overview = moviesDict["overview"] as? String ?? "Error loading overview"
                     let poster_path = moviesDict["poster_path"] as? String ?? "Error loading poster path"
                     let backdrop_path = moviesDict["backdrop_path"] as? String ?? "Error loading backdrop path"
                     let vote_average = moviesDict["vote_average"] as? Double ?? 0
                     return Movie(title: title, overview: overview, poster_path: poster_path, backdrop_path: backdrop_path, vote_average: vote_average)
                 }
             }
        }
        task.resume()
    }
    
    func createPosterUrl(_ posterPath: String) -> String {
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        return baseUrl + posterPath
    }
    
    func createBackDropUrl(_ backdropPath: String) -> String {
        return "https://image.tmdb.org/t/p/w780" + backdropPath
    }
}
