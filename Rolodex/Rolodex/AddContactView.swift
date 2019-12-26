//
//  AddContactView.swift
//  Rolodex
//
//  Created by Jason on 12/24/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var contacts: Contacts
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var name = ""
    @State private var showingImagePicker = false
    @State private var showingImageNameAlert = false
    
    private var disableSave: Bool {
        name == ""
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                        .resizable()
                        .scaledToFit()
                        
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                Spacer()
                
                Text("\(name)")
            }
            .alert(isPresented: $showingImageNameAlert) {
                Alert(title: Text("Boom"), message: Text("That worked"), dismissButton: .default(Text("Ok")))
            }
            .navigationBarTitle("Add new Contact")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .navigationBarItems(
                trailing: Button("Save") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .disabled(disableSave)
            )
        }
    }
    
    func addName() {
        print("Boom")
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
//        self.showingImageNameAlert = true
        addName()
    }
    
    //    func validateContact() {
    //        guard name != "" else {
    //            return
    //        }
    //        let contact = Contact(name: name)
    //        contacts.items.append(contact)
    //    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(contacts: Contacts())
    }
}
