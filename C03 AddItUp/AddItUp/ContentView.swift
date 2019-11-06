//
//  ContentView.swift
//  AddItUp
//
//  Created by Jason on 11/5/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var secondNumber = 0
    @State private var maxNumber = 5
    @State private var questionInputCount = 2
    @State private var question = 1
    @State private var answer = ""
    
//    @State private var firstNumber = 0
    var firstNumber: Int {
        return 0
    }
    var numberOfQuestions = [5, 10, 15, 20]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select your ADDITION table")) {
                    Stepper(value: $maxNumber, in: 0...10, step: 1) {
                        HStack {
                            Text("Up to:")
                            Text("\(maxNumber)")
                        }
                    }
                }
                Section(header: Text("How many questions")) {
                    Picker("Questions", selection: $questionInputCount) {
                        ForEach(0 ..< numberOfQuestions.count) {
                            Text("\(self.numberOfQuestions[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Question \(question)")) {
                    HStack {
                        Spacer()
                        Text("\(firstNumber)")
                            .font(.largeTitle)
                        Spacer()
                        Text("+")
                        .font(.title)
                        Spacer()
                        Text("\(firstNumber)")
                        .font(.largeTitle)
                        Spacer()
                    }
                }
                Section(header: Text("Your answer:")) {
                    TextField("Enter quantity", text: $answer)
                        .keyboardType(.decimalPad)
                }
            }
        .navigationBarTitle("Add It Up!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
