//
//  Game.swift
//  ApplePie
//
//  Created by whoana j on 2021/02/15.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    mutating func plyerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
}
