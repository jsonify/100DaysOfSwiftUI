//
//  ShowingHidingViews.swift
//  iExpense
//
//  Created by Jason on 11/6/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ShowingHidingViews: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            // contents of the sheet
            SecondView(name: "@jsonify")
        }
    }
}

struct ShowingHidingViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowingHidingViews()
    }
}
