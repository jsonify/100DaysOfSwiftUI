//
//  Movie.swift
//  MovieTrailer
//
//  Created by Jason on 1/2/20.
//  Copyright © 2020 Jason. All rights reserved.
//

/*
 A Model class contains details for each movie such as id, thumbnail, title, description, trailerLink, catagory and etc. Then I have created a Catagory which helps separate movies based on their genres
 */
import SwiftUI

struct Movie: Hashable, Codable, Identifiable {
    var id: Int
    var thumbnail: String
    var title: String
    var description: String
    var trailerLink: String
    var category: Category
    var isFeaturedMovie: Bool
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case marvel = "Marvel"
        case dc = "DC"
        case actionAdventure = "Action and Adventure"
    }
}
