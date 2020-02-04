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
    weak var quizViewModelDelegate: QuizViewModelDelegate!
    var score: [CharacterType: Double]

    func getPersonalityLabel(char: CharacterType) -> (String, String) {
        return personalityManager.personalityLabel[char]!
    }

    init(quizViewModelDelegate: QuizViewModel) {
        self.quizViewModelDelegate = quizViewModelDelegate
        personalityContainer = personalityManager.calculatePersonality(quizViewModelDelegate.getScore())
        self.score = quizViewModelDelegate.getScore()
        print(score)
    }
}
