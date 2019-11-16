//
//  ValidatingDisablingForms.swift
//  CupcakeCorner
//
//  Created by Jason on 11/15/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ValidatingDisablingForms: View {
    @State private var username = ""
    @State private var email = ""
    
    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("Creating Account...")
                }
            }
            .disabled(disabledForm)
        }
    }
}

struct ValidatingDisablingForms_Previews: PreviewProvider {
    static var previews: some View {
        ValidatingDisablingForms()
    }
}
