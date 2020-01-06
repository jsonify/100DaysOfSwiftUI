//
//  MovieRow.swift
//  MovieTrailer
//
//  Created by Jason on 1/6/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
    var categoryName: String
    var movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(self.movies, id: \.title) { movie in
                        NavigationLink(destination: MovieDetail(movie: movie)) {
                            MovieItem(movie: movie)
                                .frame(width: 300)
                                .padding(.trailing, 30)
                            .cornerRadius(10)
                            .clipped()
                        }
                    }
                }
            }
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(categoryName: "Marvel", movies: load("movies.json"))
    }
}
