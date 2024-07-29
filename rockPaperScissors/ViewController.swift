//
//  ViewController.swift
//  rockPaperScissors
//
//  Created by student on 7/17/24.
//

import UIKit

enum Choice: String, CaseIterable {
    case paper = "✋"
    case rock = "👊"
    case scissors = "✌️"
    
}
enum Outcome: String {
    case tie = "tied"
    case win = "win"
    case lost = "lost womp womp"
}



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var Robotemoji: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet var background: UIView!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var winningDisplay: UILabel!
    
    var winnStreak :Int = 0
    //rock, paper, scissors buttons.
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    
    //Action
    
    @IBAction func rockClick(_ sender: Any) {
        paper.isHidden = true
        scissors.isHidden = true
        playRound(userChoice: .rock)
    }
    
    @IBAction func paperClick(_ sender: Any) {
        rock.isHidden = true
        scissors.isHidden = true
        playRound(userChoice: .paper)
    }
    
    @IBAction func scissorsClick(_ sender: Any) {
        paper.isHidden = true
        rock.isHidden = true
        playRound(userChoice: .scissors)
    }
    
    //play again function
    @IBAction func playAgainClick(_ sender: Any) {
        view.backgroundColor = .lightGray
        Robotemoji.text = "🤖"
        rock.isHidden = false
        paper.isHidden = false
        scissors.isHidden = false
        playAgain.isHidden = true
        Description.text = "Rock, Paper, Scissors?"
    }
    
    //function
    func playRound (userChoice: Choice) {
        if playAgain.isHidden  {
            let computerChoice = getComputureChoice()
            Robotemoji.text = computerChoice.rawValue
            let outcome = decideOutcome(userChoice: userChoice, computerChoice: computerChoice)
            playAgain.isHidden = false
            Description.text = outcome.rawValue
            
            switch outcome {
            case .tie:
                view.backgroundColor = .white
            case .win:
                view.backgroundColor = .green
            case .lost:
                view.backgroundColor = .red
            }
        }
    }
    func getComputureChoice () -> Choice {
        let randomNumber = Int.random(in: 0...Choice.allCases.count - 1 )
        return Choice.allCases[randomNumber]
    }
    
    func decideOutcome(userChoice: Choice, computerChoice: Choice) -> Outcome {
        switch (userChoice, computerChoice) {
        case (.paper, .paper), (.rock, .rock), (.scissors, .scissors):
            return .tie
        case (.paper, .rock), (.rock, .scissors), (.scissors, .paper):
            winnStreak += 1
            winningDisplay.text = "winning strak \(winnStreak)"
            return .win
        case (.paper, .scissors), (.rock, .paper), (.scissors, .rock):
            winnStreak = 0
            winningDisplay.text = "winning strak \(winnStreak)"
            return .lost
            
        }
    }
    
}
    
    
