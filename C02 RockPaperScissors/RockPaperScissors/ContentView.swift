//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jason Rueckert on 10/19/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

enum ActiveAlert {
    case first, second
}

struct ContentView: View {
    
    @State private var item = ["rock", "paper", "scissors"].shuffled()
    @State private var choice = ["Win", "Lose"].shuffled()
    @State private var gameOver = false
    @State private var scoreTitle = ""
    @State private var score: Int = 0
    @State private var randomChoice = Int.random(in: 0...2)
    @State private var answerMessage = ""
    @State private var questionNumber = 1
    @State private var successfulRound = false
    
    var currentItem: String {
        return item[randomChoice]
    }
    var requiredChoiceWin: String {
        if (currentItem == "rock") {
            return "paper"
        } else if (currentItem == "paper") {
            return "scissors"
        } else {
            return "rock"
        }
    }
    
    var requiredChoiceLose: String {
        if (currentItem == "rock") {
            return "scissors"
        } else if (currentItem == "paper") {
            return "rock"
        } else {
            return "paper"
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.init(hue: 0.18, saturation: 0.93, brightness: 0.94), .init(hue: 0.05, saturation: 0.78, brightness: 0.95)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Text("iPhone chooses:")
                    .padding(5)
                Image(currentItem)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                    .shadow(color: .gray, radius: 20)
                HStack {
                    Text("Player should:")
                    Text("\(choice[0])")
                        .fontWeight(.black)
                }
                Spacer()
                if questionNumber > 1 {
                    Text(successfulRound ? "Last round: Victory" : "Last round: Failure")
                }
                Spacer()
                ForEach(0..<3) { number in
                    Button(action: {
                        self.itemTapped(number)
                    }) {
                        Image(self.item[number])
                            .renderingMode(.original)
                    }
                    .shadow(color: .gray, radius: 20)
                }
                Spacer()
                Text("Q:\(questionNumber), Score: \(score)")
            }
            .alert(isPresented: $gameOver) {
                Alert(title: Text("Game Over"), message: Text("Great Job. Your score is: \(score)"), dismissButton: .default(Text("Continue")){
                    self.newGame()
                    })
            }
        }
        
    }
    
    func itemTapped(_ number: Int) {
        if (questionNumber < 6) {
            if ((choice[0] == "Win") && (item[number] == requiredChoiceWin)) {
                successfulRound = true
                answerMessage = "Great Job. You outsmarted your phone."
                score += 1
                questionNumber += 1
                runGame()
            } else if ((choice[0] == "Lose") && item[number] == requiredChoiceLose) {
                successfulRound = true
                answerMessage = "Since you lost because you were told to, you win!"
                score += 1
                questionNumber += 1
                runGame()
            } else if (choice[0] == item[number]) {
                score += 0
                questionNumber += 1
                runGame()
            } else {
                successfulRound = false
                answerMessage = "Wrong!!!"
                score -= 1
                questionNumber += 1
                runGame()
            }
        } else {
            gameOver = true
        }
    }
    
    func runGame() {
        item.shuffle()
        choice.shuffle()
    }
    
    func newGame() {
        runGame()
        gameOver = false
        score = 0
        questionNumber = 1
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
