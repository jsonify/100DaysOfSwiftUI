//
//  TouchIDFaceID.swift
//  BucketList
//
//  Created by Jason on 12/16/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import LocalAuthentication
import SwiftUI

struct TouchIDFaceID: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if self.isUnlocked == true {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
    .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // there was a problem
                    }
                }
            }
        } else {
            // no biometrics
        }
    }

}

struct TouchIDFaceID_Previews: PreviewProvider {
    static var previews: some View {
        TouchIDFaceID()
    }
}
