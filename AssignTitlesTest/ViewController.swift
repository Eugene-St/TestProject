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
    
    @IBOutlet weak var correctIncorrect: UILabel!
    
    var buttons = [UIButton]()
    var game = Game()
    var timer = Timer()
    let intervalInSeconds = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [button1, button2, button3, button4]
        defaultUiView()
        displayQuestion()
        game.collectedIndexes = []
    }
    
    func displayQuestion() // DOES NOT WORK !!!
    {
        game.generateQuestion()
        textPosition.text = game.questionToDisplay.question
        //displayButtonTitles()
        correctIncorrect.isHidden = true
    }
    
    func displayButtonTitles()
    {
        
        for button in buttons
        {
            var questionToDisplay = game.questionToDisplay
            var index = GKRandomSource.sharedRandom().nextInt(upperBound: questionToDisplay.answerChoices.count)
            
            while game.collectedIndexes.contains(index)
            {
                index = GKRandomSource.sharedRandom().nextInt(upperBound: questionToDisplay.answerChoices.count)
            }
            
            game.collectedIndexes.append(index)
            
            button.setTitle(questionToDisplay.answerChoices[index], for: .normal)
        }
    }
    
    @IBAction func checkAnswers(_ sender: UIButton) {
        correctIncorrect.isHidden = false
        game.questionsAsked += 1
        print("Questions Asked \(game.questionsAsked)") // PRINT
        if sender.currentTitle == game.questionToDisplay.correctAnswer
        {
            sender.flash()
            correctIncorrect.text = "Correct"
            correctIncorrect.textColor = UIColor.green
            game.correctAnswers += 1
            print("Correct Answers \(game.correctAnswers)") // PRINT
            sender.backgroundColor = UIColor.green
        }
            else
        {
            sender.shake()
            sender.backgroundColor = UIColor.red
           correctIncorrect.text = "Incorrect"
            correctIncorrect.textColor = UIColor.red
            print("Incorrect Answer") // PRINT
            
        }
        
        loadNextRoundWithDelay(seconds: 2)
        
    }
    
    @IBAction func nextQuestionCheck() {
        displayQuestion()
        print("Previous index is - \(game.collectedIndexes)")
        print("Selected index is - \(game.selectedIndex)")

    }
    
    
    func defaultUiView()
    {
        textPosition.textColor = UIColor.white
        correctIncorrect.textColor = UIColor.white
        for button in buttons
        {
            button.layer.cornerRadius = 15
            button.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    func displayScore()
    {
        for button in buttons
        {
            button.isHidden = true
        }
        
        textPosition.text = "Great, you have finished. Your score is \(game.correctAnswers) of \(game.questionsPerRound)"
        correctIncorrect.isHidden = true
    }
    
    func nextRound()
    {
        print("Timer works")
        /*
         if game.questionsAsked == game.questionsPerRound
        {
            displayScore()
        } else {
         */
            displayQuestion()
        //}
    
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


























