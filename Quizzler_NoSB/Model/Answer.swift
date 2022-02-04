//
//  Answer.swift
//  Quizzler_NoSB
//
//  Created by Raúl Pavón on 04/02/22.
//

import Foundation

struct Answer {
    var question: String
    var progress: Float
    var score: Int
    
    init() {
        self.question = ""
        self.progress = 0.0
        self.score = 0
    }
}
