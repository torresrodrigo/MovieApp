//
//  DetailMovie.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 23/11/2021.
//

import Foundation

struct DetailMovie: Codable {
    let id: Int
    let adult: Bool
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case title = "original_title"
    }
    
}
