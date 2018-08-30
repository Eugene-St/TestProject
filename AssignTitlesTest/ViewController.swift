//
//  ViewController.swift
//  AssignTitlesTest
//
//  Created by Eugene St on 8/28/18.
//  Copyright © 2018 Eugene St. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    @IBOutlet weak var textPosition: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    //@IBOutlet weak var correctIncorrect: UILabel!
    @IBOutlet weak var partView: UIView!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var quizzCompleteLAbel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    
    var buttons = [UIButton]()
    var game = Game()
    var timer = Timer()
    //let intervalInSeconds = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [button1, button2, button3, button4]
        displayQuestion()
    }
    
    func defaultStyle()
    {
        for button in buttons
        {
            button.layer.borderWidth = 2.5
            button.layer.borderColor = UIColor.black.cgColor
            button.isEnabled = true
            button.isHidden = false
            button.backgroundColor = UIColor(displayP3Red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0)
        }
        //correctIncorrect.isHidden = true
        playAgain.isHidden = true
        count.isHidden = false
        progress.isHidden = true // DO NOT FORGET TO DELETE THIS STRING!
        scoreLabel.isHidden = true
        quizzCompleteLAbel.isHidden = true
        scoreText.isHidden = true
        textPosition.isHidden = false
        partView.isHidden = false
        mainView.backgroundColor = UIColor(displayP3Red: 244/255, green: 216/255, blue: 142/255, alpha: 1.0)
    }
    
    func displayQuestion()
    {
        defaultStyle()
        game.generateQuestion()
        textPosition.text = game.questionToDisplay.question
        displayButtonTitles()
        //count.text = "\(game.questionsAsked) / \(game.questionsPerRound)"
        print(game.questionsAsked)
        count.text = "\(game.questionsAsked) / \(game.questionsPerRound)"
    }
    
    func displayButtonTitles()
    {
        for button in buttons
        {
                var choices = game.questionToDisplay.answerChoices
                let index = GKRandomSource.sharedRandom().nextInt(upperBound: choices.count)
                button.setTitle(choices[index], for: .normal)
                choices.remove(at: index)
                button.isEnabled = true
        }
        print(game.questionToDisplay.answerChoices)
    }
    
    @IBAction func checkAnswers(_ sender: UIButton) {
        for button in buttons
        {
            button.isEnabled = false
        }
        //correctIncorrect.isHidden = false
        game.questionsAsked += 1
        if sender.currentTitle == game.questionToDisplay.correctAnswer
        {
            sender.flash()
            //correctIncorrect.text = "Correct!"
            //correctIncorrect.textColor = UIColor(displayP3Red: 60/255, green: 189/255, blue: 192/255, alpha: 1.0)
            game.correctAnswers += 1
            sender.backgroundColor = UIColor(displayP3Red: 60/255, green: 189/255, blue: 192/255, alpha: 1.0)
        }
            else
        {
            sender.shake()
            sender.backgroundColor = UIColor.red
           //correctIncorrect.text = "Incorrect"
            //correctIncorrect.textColor = UIColor.red
            print("Incorrect Answer") // PRINT
            
            for button in buttons
            {
                if button.currentTitle == game.questionToDisplay.correctAnswer
                {
                    button.backgroundColor = UIColor(displayP3Red: 60/255, green: 189/255, blue: 192/255, alpha: 1.0)
                }
                
            }
            
        }
        
        count.text = "\(game.questionsAsked) / \(game.questionsPerRound)"
        loadNextRoundWithDelay(seconds: 2)
    }
    
    @IBAction func playAgainAction(_ sender: UIButton)
    {
        displayQuestion()
        game.questionsAsked = 0
        
        
    }

    func displayScore()
    {
        for button in buttons
        {
            button.isHidden = true
        }
        playAgain.isHidden = false
        textPosition.isHidden = true
        playAgain.layer.borderWidth = 2
        playAgain.layer.borderColor = UIColor.black.cgColor
        //correctIncorrect.isHidden = true
        count.isHidden = true
        partView.isHidden = true
        mainView.backgroundColor = UIColor(displayP3Red: 60/255, green: 189/255, blue: 192/255, alpha: 1.0)
        quizzCompleteLAbel.isHidden = false
        scoreLabel.isHidden = false
        scoreLabel.text = "\(100 * game.correctAnswers / game.questionsPerRound)%"
        scoreText.isHidden = false
        
    }
    
    func nextRound()
    {
        if game.questionsAsked == game.questionsPerRound
        {
        displayScore()
        } else
        {
        displayQuestion()
        defaultStyle()
        }
    }
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
}


























