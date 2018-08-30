import Foundation
import GameKit

struct Game
{
    var questions = [Question]() // To collect all questions in one array
    
    var collectedIndexes = [Int]() // Will be used to randomize Answers
    
    var questionToDisplay: Question // To display current question
    
    var correctAnswers = 0 // Will catch all correct answers
    
    var questionsAsked = 0 // Will catch ALL answers
    
    var selectedIndex = 0
    
    var correctAnswer = ""
    
    let questionsPerRound = 5
    
    let question1 = Question(question: "Four stories about a honey-loving bear and his friends", answerChoices: ["Dumbo", "Bolt", "Oliver and Company", "Adventures of Winnie the Pooh"], correctAnswer: "Adventures of Winnie the Pooh")
    
    let question2 = Question(question: "A wooden puppet needs to be brave, truthful and unselfish to become human", answerChoices: ["Brave", "Peter Pan", "Saludos Amigos", "Pinocchio"], correctAnswer: "Pinocchio")
    
    let question3 = Question(question: "Two creatures try to return a young girl back to her parellel world", answerChoices: ["The Rescuers Down Under", "Monsters, Inc.", "A Bug's Life", "The Incredibles"], correctAnswer: "Monsters, Inc.")
    
    let question4 = Question(question: "A girl has several adventures after following a rabbit into a rabbit hole", answerChoices: ["Pocahontas", "The Little Marmaid", "Alice in Worderland", "Cinderella"], correctAnswer: "Alice in Worderland")
    
    let question5 = Question(question: "A mean and wealthy woman goes a long way to get a fur coat", answerChoices: ["The Emperor's New Groove", "WHite and Seven Dwarfs", "One Hundred and One Dalmatians", "Beauty and the Beast"], correctAnswer: "One Hundred and One Dalmatians")
    
    let question6 = Question(question: "A man raised by gorillas falls in love with the daughter of an English explorer", answerChoices: ["Beauty and the Beast", "Tarzan", "The Jungle Book", "Peter Pan"], correctAnswer: "Tarzan")
    
    let question7 = Question(question: "The arrival of a new birthday present leads to jealousy and adventures while moving to a new house", answerChoices: ["Toy Story", "Finding Nemo", "The Aristocats", "Adventures of Winnie the Pooh"], correctAnswer: "Toy Story")
    
    let question8 = Question(question: "A leader is killed by his brother and is later challenged by the leader's son", answerChoices: ["The Sword in the Stone", "The Lion King", "The Jungle Book", "Frozen"], correctAnswer: "The Lion King")
    
    let question9 = Question(question: "A TV show dog thinks he has super powers and tries to find the girl that plays his owner", answerChoices: ["Wreck-it Ralph", "Finding Nemo", "Up", "Bolt"], correctAnswer: "Bolt")
    
    let question10 = Question(question: "A teenage princess is tricked to touch an enchanted spinning wheel", answerChoices: ["Sleeping Beauty", "Cinderella", "White and Seven Dwarfs", "Tangled"], correctAnswer: "Sleeping Beauty")
    
    init()
    {
        questions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10]
        questionToDisplay = question1
    }
    
    mutating func generateQuestion()
    {
        selectedIndex = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        
        while collectedIndexes.contains(selectedIndex)
        {
            selectedIndex = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        }
        
        collectedIndexes.append(selectedIndex)
        questionToDisplay = questions[selectedIndex]
        correctAnswer = questions[selectedIndex].correctAnswer
    }

}









