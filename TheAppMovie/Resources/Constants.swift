//
//  Constants.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 22/11/2021.
//

import Foundation
import UIKit

struct Constants {
    
    static let apiKey = "?api_key=85b2363b48eabdc85801f1a96bec7702"
    
    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
    }
    
    struct Endpoints {
        static let urlListPopularMovies = "3/movie/popular"
        static let urlDetailMovie = "3/movie/"
    }
    
    struct Colors {
        static let primary = UIColor(named: "primary")
    }
    
}
