//
//  Game.swift
//  ApplePie
//
//  Created by whoana j on 2021/02/15.
//

import Foundation

struct Game {
    
    var word: String
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord.append(letter)
            } else {
                guessedWord.append("_")
            }
        }
        return guessedWord
    }
    
    var incorrectMovesRemaining: Int
    
    var guessedLetters: [Character]
    
    
    
    mutating func plyerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
        
        print("Game.word:\(word), guess word:\(String(guessedLetters))")
    }
    
}
