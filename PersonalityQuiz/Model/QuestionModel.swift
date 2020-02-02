//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-10.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

enum AnswerType: String, CaseIterable {
    case stronglyAgree
    case agree
    case neutral
    case disagree
    case stronglyDisagree

    var stringRepresentation: String {
        switch self {
        case .stronglyAgree:
            return "Strongly Agree"
        case .agree:
            return "Agree"
        case .neutral:
            return "Neutral"
        case .disagree:
            return "Disagree"
        case .stronglyDisagree:
            return "Strongly Disagree"
        }
    }
}

extension AnswerType: Identifiable {
    var id: String {
        rawValue
    }
}

struct Question {
    let question: String
    let questionType: CharacterType
    let isPositive: Bool

    init(question: String, questionType: CharacterType, isPositive: Bool) {
        self.question = question
        self.questionType = questionType
        self.isPositive = isPositive
    }
}
