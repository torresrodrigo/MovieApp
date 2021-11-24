//
//  Movies.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 22/11/2021.
//

import Foundation

struct Movies: Codable {
    let listOfMovies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case listOfMovies = "results"
    }
    
}

struct Movie: Codable {
    let title: String
    let id : Int
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case id 
    }
    
    
}
