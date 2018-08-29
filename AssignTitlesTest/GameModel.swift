//
//  GameModel.swift
//  AssignTitlesTest
//
//  Created by Eugene St on 8/28/18.
//  Copyright © 2018 Eugene St. All rights reserved.
//

import Foundation

struct Question
{
    var question: String
    var answerChoices: [String]
    var correctAnswer: String
    
    init(question: String, answerChoices: [String], correctAnswer: String)
    {
        self.question = question
        self.answerChoices = answerChoices
        self.correctAnswer = correctAnswer
    }
}
