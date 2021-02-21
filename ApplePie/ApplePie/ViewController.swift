//
//  ViewController.swift
//  ApplePie
//
//  Created by whoana j on 2021/02/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var pointLabel: UILabel!
    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    var currentGame: Game!
    func newRound(){
        if !listOfWords.isEmpty {
             
 
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            
            updateUI()
        
            enableLetterButtons(true)
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI(){
        
        var letters = [String]()
        //strech goal
        //1. how to use map method
//        for letter in currentGame.formattedWord {
//            letters.append(String(letter))
//        }
        
        letters = currentGame.formattedWord.map { (letter) -> String in
            return String(letter)
        }
        
        correctWordLabel.text = letters.joined(separator: " ")
        
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.plyerGuessed(letter: letter)
        updateGameState()
        print("letterButtonPressed....")

    }
    
    func updateGameState(){
        if currentGame.formattedWord == currentGame.word {
            totalWins += 1
        } else if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else {
            updateUI()
        }
    }
    
    
}

