//
//  Question.swift
//  QuizApp
//
//  Created by Bartuğ Kaan Çelebi on 27.03.2023.
//

import Foundation

struct Question{
    let text : String
    let options : [String]
    let answer : String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.options = a
        self.answer = correctAnswer
    }
}
