//
//  QuizManager.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-11.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    private var questionManager = QuestionManager()

    @Published var quiz: [Question] = []
    @Published var currentQuestionIndex = 0
    @Published var quizCompleted: Bool = false
    @Published var showQuiz: Bool = false

    var answers: [Double] = []

    init() {
        print("Set Initial Quiz View Model")
        setInitialState()
    }

    func startQuiz() {
        self.showQuiz = true
    }

    func restart() {
        setInitialState()
        questionManager = QuestionManager()
    }

    func setupAdditionalQuestions() {
        quiz.append(contentsOf: questionManager.getAdditionalQuestions())
        answers.append(contentsOf: [Double](repeating: 5, count: 50))
    }

    func getScore(type: AnswerType, isPositive: Bool) -> Double {
        switch type {
        case .stronglyAgree:
            return isPositive ? 10 : 0
        case .agree:
            return isPositive ? 7 : 3
        case .neutral:
            return isPositive ? 5 : 5
        case .disagree:
            return isPositive ? 3 : 7
        case .stronglyDisagree:
            return isPositive ? 0 : 10
        }
    }

    func getCurrentQuestion() -> Question {
        return quiz[currentQuestionIndex]
    }

    func previousQuestion() {
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
        }
    }

    func submitAnswer(answer: AnswerType) {
        if !quizCompleted {
            answers[currentQuestionIndex] = getScore(type: answer, isPositive: quiz[currentQuestionIndex].isPositive)
            if currentQuestionIndex < quiz.count - 1 {
                currentQuestionIndex += 1
            } else {
                quizCompleted = true
            }
        }

    }

    private func setInitialState() {
        showQuiz = false

        quiz = questionManager.getQuestions()
        currentQuestionIndex = 46 //
        answers = [Double](repeating: 5, count: 50)
    }
}

protocol QuizViewModelDelegate: class {
    func quitQuiz()
    func getScore() -> [CharacterType: Double]
}

extension QuizViewModel: QuizViewModelDelegate {
    func quitQuiz() {
        restart()
    }

    func getScore() -> [CharacterType: Double] {
        var score: [CharacterType: Double] = [
            .extrovert: 0,
            .intuitive: 0,
            .feeling: 0,
            .judging: 0,
            .assertive: 0
        ]

        for index in 0..<answers.count {
            score[quiz[index].questionType]! += answers[index]
        }
        let percentageScore = score.mapValues { value in
            return value / 100.0
        }
        return percentageScore
    }
}
