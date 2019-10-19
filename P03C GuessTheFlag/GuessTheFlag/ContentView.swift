//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jason Rueckert on 10/15/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

// Challenge 3
struct FlagImage: View {
    var flagNumber: String
    
    var body: some View {
        Image(flagNumber)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    @State private var countries = ["US", "UK", "Spain", "Russia", "Poland", "Nigeria", "Monaco", "Italy", "Ireland", "Germany", "France", "Estonia"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var answerMessage = ""
    
    // Challenge 1
    @State private var score: Int = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        // Challenge 3
                        FlagImage(flagNumber: self.countries[number])
                    }
                }
                // Challenge 2
                HStack {
                    Text("Your current score is")
                    .foregroundColor(.white)
                    Text("\(score)")
                        .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            // Challenge 1
            Alert(title: Text(scoreTitle), message: Text(answerMessage), dismissButton: .default(Text("Continue")){
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            // Challenge 1
            score += 1
            answerMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            // Challenge 3
            answerMessage = "The that was the flag for \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
