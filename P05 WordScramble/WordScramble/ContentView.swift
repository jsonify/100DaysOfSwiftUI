 //
//  ContentView.swift
//  WordScramble
//
//  Created by Jason on 10/31/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
// Challenge 3
    @State private var score = 0
    @State private var scoreMultiplier = 1

    // word validation
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false


    var body: some View {
        NavigationView {
            VStack {
                Text("How many three or more letter words can you find in the word:")
                    .padding()
                Text("\(rootWord)")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding()
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
// Challenge 3
                Form {
                    Section(header: Text("Score: \(score)")) {
                        List(usedWords, id: \.self) {
                            Image(systemName: "\($0.count).circle")
                            Text($0)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("WordScramble"))
// Challenge 2
                .navigationBarItems(leading:
                    Button(action: startGame) {
                        Text("New Game")
                    }
                )
                .onAppear(perform: startGame)
                .alert(isPresented: $showingError) {
                    Alert(title: Text("\(errorTitle)"), message: Text("\(errorMessage)"), dismissButton: .default(Text("OK")))
            }
        }
    }

    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {
            return
        }

        guard isOriginal(word: answer) else {
            wordError(title: "Word is already used", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word.")
            return
        }
// Challenge 1
        guard isLongEnough(word: answer) else {
            wordError(title: "Word not long enough", message: "Your word is not the 3 letter minimum for this game.")
            return
        }

        usedWords.insert(answer, at: 0)
// Challenge 3
        let scoreCount = usedWords[0].count
        if scoreCount == 3 {
            scoreMultiplier = 1
        } else if scoreCount == 4 {
            scoreMultiplier = 2
        } else if scoreCount == 5 {
            scoreMultiplier = 3
        } else if scoreCount == 6 {
            scoreMultiplier = 4
        } else if scoreCount == 7 {
            scoreMultiplier = 5
        } else {
            scoreMultiplier = 6
        }

        score = score + (scoreCount * scoreMultiplier)
        newWord = ""
    }

    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
// Challenge 2
                usedWords.removeAll()
                return
            }
        }

        fatalError("Could not load start.txt from Bundle")
    }

    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }

    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
// Challenge 1
    func isLongEnough(word: String) -> Bool {
        guard word.count >= 3 else {
            return false
        }
        return true
    }

    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }

    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
