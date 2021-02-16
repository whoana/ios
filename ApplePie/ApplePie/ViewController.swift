//
//  ViewController.swift
//  ApplePie
//
//  Created by whoana j on 2021/02/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    var currentGame: Game!
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorectMovesRemaining)")
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
}

