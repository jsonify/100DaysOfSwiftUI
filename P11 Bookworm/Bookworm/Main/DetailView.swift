//
//  DetailView.swift
//  Bookworm
//
//  Created by Jason on 11/22/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailView: View {
    // one to hold our Core Data managed object context (so we can delete stuff)
    @Environment(\.managedObjectContext) var moc
    // one to hold our presentation mode (so we can pop the view off the navigation stack)
    @Environment(\.presentationMode) var presentationMode
    // one to control whether we’re showing the delete confirmation alert or not
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    // Challenge 3
    private var formattedDate: String {
        guard let date = book.date else {
            return "..."
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                
                Text(self.book.author ?? "Unknown Author")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text("\"\(self.book.review ?? "No Review")\"")
                    .italic()
                    .padding()
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                    .padding()
                
                // Challenge 3
                Text("Added: \(self.formattedDate)")
                    .font(.caption)
                .padding()
                
                Spacer()
            }
        }
        .alert(isPresented: $showingDeleteAlert) {
            // use “Delete” for the destructive button
            Alert(title: Text("Delete Book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Ok")) {
                // call the deleteBook method
                self.deleteBook()
                // then provide a .cancel() button next to it so users can back out of deleting if they want
                }, secondaryButton: .cancel())
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
            // add a navigation bar item that starts the deletion process – this just need to flip the showingDeleteAlert Boolean
            .navigationBarItems(trailing: Button(action: {
                self.showingDeleteAlert = true
            }) {
                Image(systemName: "trash")
            })
    }
    
    func deleteBook() {
        moc.delete(book)
        
        presentationMode.wrappedValue.dismiss()
    }
}

extension Book {
    
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test Book"
        book.author = "Test Author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book. Really enjoyed it."
        book.date = Date()
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
