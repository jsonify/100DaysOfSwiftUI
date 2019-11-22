//
//  Application.swift
//  Bookworm
//
//  Created by Jason on 11/19/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct Application: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    var body: some View {
        NavigationView {
            Text("Count: \(books.count)")
                .navigationBarTitle("Bookworm")
                .navigationBarItems(trailing: Button(action: {
                    self.showingAddScreen.toggle()
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView().environment(\.managedObjectContext, self.moc)
                }
        }
    }
}

struct Application_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}
