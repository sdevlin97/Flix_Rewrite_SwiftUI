//
//  MovieModel.swift
//  Flix_Rewrite
//
//  Created by Siobahn Devlin on 11/30/22.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let overview: String
    let poster_path: String
    let backdrop_path: String
    let vote_average: Double
}
