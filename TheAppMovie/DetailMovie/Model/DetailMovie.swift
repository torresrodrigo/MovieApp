//
//  DetailMovie.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 23/11/2021.
//

import Foundation

struct DetailMovie: Codable {
    let id: Int
    let title: String
    let originalLanguage: String
    let image: String
    let realeaseDate: String
    let average: Double
    let genres: [Generes]
    let status: String
    let originalTitle: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalLanguage = "original_language"
        case image = "backdrop_path"
        case realeaseDate = "release_date"
        case genres 
        case status
        case average = "vote_average"
        case originalTitle = "original_title"
    }
    
}

struct Generes: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    
}
