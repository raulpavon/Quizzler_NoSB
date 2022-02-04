//
//  Question.swift
//  Quizzler_NoSB
//
//  Created by Raúl Pavón on 04/02/22.
//

import Foundation

struct Question {
    let question: String
    let answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}
