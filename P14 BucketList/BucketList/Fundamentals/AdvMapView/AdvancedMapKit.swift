//
//  AdvancedMapKit.swift
//  BucketList
//
//  Created by Jason on 12/17/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import LocalAuthentication
import MapKit
import SwiftUI

struct AdvancedMapKit: View {
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingEditScreen = false
    @State private var isUnlocked = false
    
    // Challenge 3
    @State private var showingAuthError = false
    
    @State private var authErrorMessage = ""
    
    var body: some View {
        ZStack {
            if isUnlocked {
                AnnotatedMapView(selectedPlace: $selectedPlace, showingEditScreen: $showingEditScreen, annotations: $locations)
            } else {
                Button("Unlock Places") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
        .alert(isPresented: $showingAuthError) {
            //write auth error
            Alert(title: Text("Authorization Error"), message: Text(authErrorMessage), dismissButton: .default(Text("Ok")))
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
            if self.selectedPlace != nil {
                EditView(placemark: self.selectedPlace!)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let filename = getDocumentsDirectory()
            .appendingPathComponent("SavedPlaces")
        
        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print("Unable to load saved data")
        }
    }
    
    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourelf to unlock your places"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // there was a problem
                        self.authErrorMessage = "Sorry, you're not recognized"
                        self.showingAuthError = true
                    }
                }
            }
        } else {
            // no biometrics
            self.authErrorMessage = "Whoops, no biometrics were found."
            self.showingAuthError = true
        }
    }
}

struct AdvancedMapKit_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedMapKit()
    }
}
