//
//  AddBookView.swift
//  Bookworm
//
//  Created by Jason on 11/21/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    // Challenge 1
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var date = Date()
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section {
                    RatingView(rating: $rating)

                    TextField("Write a review", text: $review)
                }

                Section {
                    Button("Save") {
                        // create an instance of the Book class using our managed object context
                        let newBook = Book(context: self.moc)
                        // copy in all the values from our form
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.review = self.review
                        newBook.genre = self.genre
                        // convert rating to an Int16 to match Core Data
                        newBook.rating = Int16(self.rating)
                        
                        newBook.date = self.date
                        
                        // save the managed object context
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
