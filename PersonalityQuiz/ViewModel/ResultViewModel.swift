//
//  ResponseViewModel.swift
//  PersonalityQuiz
//
//  Created by Jing Song Du on 2020-01-28.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

class ResultViewModel: ObservableObject {
    private var personalityManager = PersonalityManager()
    @Published var personalityContainer: PersonalityContainer
    @Published var score: [CharacterType: Int]
    weak var quizViewModelDelegate: QuizViewModelDelegate!

    init(quizViewModelDelegate: QuizViewModel) {
        self.quizViewModelDelegate = quizViewModelDelegate
        var testScore: [CharacterType: Int] = [:]

        for char in quizViewModelDelegate.getScore() {
            testScore[char.key] = Int(char.value * 100)
        }
        self.score = testScore
        personalityContainer = personalityManager.calculatePersonality(quizViewModelDelegate.getScore())
    }
}
