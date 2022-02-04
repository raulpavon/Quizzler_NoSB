//
//  QuizManager.swift
//  Quizzler_NoSB
//
//  Created by Raúl Pavón on 04/02/22.
//

import Foundation

struct QuizManager {
    let quiz = [
        Question(question: GlobalConstants.Questions.q1, answer: GlobalConstants.Quizzler.True),
        Question(question: GlobalConstants.Questions.q2, answer: GlobalConstants.Quizzler.True),
        Question(question: GlobalConstants.Questions.q3, answer: GlobalConstants.Quizzler.True),
        Question(question: GlobalConstants.Questions.q4, answer: GlobalConstants.Quizzler.True),
        Question(question: GlobalConstants.Questions.q5, answer: GlobalConstants.Quizzler.False),
        Question(question: GlobalConstants.Questions.q6, answer: GlobalConstants.Quizzler.True),
        Question(question: GlobalConstants.Questions.q7, answer: GlobalConstants.Quizzler.False),
        Question(question: GlobalConstants.Questions.q8, answer: GlobalConstants.Quizzler.True),
        Question(question: GlobalConstants.Questions.q9, answer: GlobalConstants.Quizzler.True),
        Question(question: GlobalConstants.Questions.q10, answer: GlobalConstants.Quizzler.False),
        Question(question: GlobalConstants.Questions.q11, answer: GlobalConstants.Quizzler.False),
        Question(question: GlobalConstants.Questions.q12, answer: GlobalConstants.Quizzler.True)
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
        }
        return userAnswer == quiz[questionNumber].answer
    }
    
    func getQuestion() -> String {
        return quiz[questionNumber].question
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
