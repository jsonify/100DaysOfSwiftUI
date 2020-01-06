//
//  MovieDetail.swift
//  MovieTrailer
//
//  Created by Jason on 1/6/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: moviesData.first!)
    }
}
