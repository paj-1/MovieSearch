//
//  MSMovieEntity.swift
//  MovieSearch
//

import Foundation

struct MSMoviesList: Codable {
    var search: [MSMovies]
    var totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct MSMovies: Codable {
    var title, year, imdbID: String
    var type: TypeEnum
    var poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}
