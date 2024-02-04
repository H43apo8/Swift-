//
//  Movies.swift
//  myProject
//
//  Created by Максим Бобков on 15.01.2024.
//

struct MoviesResults: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let siteUrl: String
    let title: String
    let bodyText: String
    let country: String
    let year: Int
    let imdbRating: Double
    
    enum CodingKeys: String, CodingKey {
        case siteUrl = "site_url"
        case title
        case bodyText = "body_text"
        case country
        case year
        case imdbRating = "imdb_rating"
    }
}


